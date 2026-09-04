-- J-Flashcard initial schema: decks, cards, card_examples, review_logs + RLS

create extension if not exists "pgcrypto";

create type public.card_state as enum ('new', 'learning', 'review', 'relearning');
create type public.anki_rating as enum ('again', 'hard', 'good', 'easy');

-- decks ----------------------------------------------------------------

create table public.decks (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users (id) on delete cascade,
  title text not null,
  description text,
  category text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index decks_user_id_idx on public.decks (user_id);

-- cards ------------------------------------------------------------------

create table public.cards (
  id uuid primary key default gen_random_uuid(),
  deck_id uuid not null references public.decks (id) on delete cascade,
  word text not null,
  reading text,
  meaning text not null,
  part_of_speech text not null,

  -- FSRS scheduling fields
  state public.card_state not null default 'new',
  stability double precision not null default 0,
  difficulty double precision not null default 0,
  interval double precision not null default 0,
  repetitions integer not null default 0,
  lapses integer not null default 0,
  due_date timestamptz not null default now(),
  last_reviewed_at timestamptz,

  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index cards_deck_id_idx on public.cards (deck_id);
create index cards_due_date_idx on public.cards (due_date);

-- card_examples ------------------------------------------------------------

create table public.card_examples (
  id uuid primary key default gen_random_uuid(),
  card_id uuid not null references public.cards (id) on delete cascade,
  text text not null,
  reading text,
  meaning text not null,
  sort_order integer not null default 0,
  created_at timestamptz not null default now()
);

create index card_examples_card_id_idx on public.card_examples (card_id);

-- review_logs --------------------------------------------------------------

create table public.review_logs (
  id uuid primary key default gen_random_uuid(),
  card_id uuid not null references public.cards (id) on delete cascade,
  user_id uuid not null references auth.users (id) on delete cascade,
  rating public.anki_rating not null,
  state public.card_state not null,
  stability double precision not null,
  difficulty double precision not null,
  elapsed_days double precision not null default 0,
  scheduled_days double precision not null default 0,
  reviewed_at timestamptz not null default now()
);

create index review_logs_card_id_idx on public.review_logs (card_id);
create index review_logs_user_id_idx on public.review_logs (user_id);

-- updated_at trigger helper --------------------------------------------------

create function public.set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

create trigger decks_set_updated_at
  before update on public.decks
  for each row execute function public.set_updated_at();

create trigger cards_set_updated_at
  before update on public.cards
  for each row execute function public.set_updated_at();

-- Row Level Security ---------------------------------------------------------

alter table public.decks enable row level security;
alter table public.cards enable row level security;
alter table public.card_examples enable row level security;
alter table public.review_logs enable row level security;

-- decks: owner-only access
create policy "decks_select_own" on public.decks
  for select using (auth.uid() = user_id);
create policy "decks_insert_own" on public.decks
  for insert with check (auth.uid() = user_id);
create policy "decks_update_own" on public.decks
  for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "decks_delete_own" on public.decks
  for delete using (auth.uid() = user_id);

-- cards: access via owning deck
create policy "cards_select_own" on public.cards
  for select using (
    exists (select 1 from public.decks d where d.id = deck_id and d.user_id = auth.uid())
  );
create policy "cards_insert_own" on public.cards
  for insert with check (
    exists (select 1 from public.decks d where d.id = deck_id and d.user_id = auth.uid())
  );
create policy "cards_update_own" on public.cards
  for update using (
    exists (select 1 from public.decks d where d.id = deck_id and d.user_id = auth.uid())
  ) with check (
    exists (select 1 from public.decks d where d.id = deck_id and d.user_id = auth.uid())
  );
create policy "cards_delete_own" on public.cards
  for delete using (
    exists (select 1 from public.decks d where d.id = deck_id and d.user_id = auth.uid())
  );

-- card_examples: access via card -> deck ownership
create policy "card_examples_select_own" on public.card_examples
  for select using (
    exists (
      select 1 from public.cards c
      join public.decks d on d.id = c.deck_id
      where c.id = card_id and d.user_id = auth.uid()
    )
  );
create policy "card_examples_insert_own" on public.card_examples
  for insert with check (
    exists (
      select 1 from public.cards c
      join public.decks d on d.id = c.deck_id
      where c.id = card_id and d.user_id = auth.uid()
    )
  );
create policy "card_examples_update_own" on public.card_examples
  for update using (
    exists (
      select 1 from public.cards c
      join public.decks d on d.id = c.deck_id
      where c.id = card_id and d.user_id = auth.uid()
    )
  ) with check (
    exists (
      select 1 from public.cards c
      join public.decks d on d.id = c.deck_id
      where c.id = card_id and d.user_id = auth.uid()
    )
  );
create policy "card_examples_delete_own" on public.card_examples
  for delete using (
    exists (
      select 1 from public.cards c
      join public.decks d on d.id = c.deck_id
      where c.id = card_id and d.user_id = auth.uid()
    )
  );

-- review_logs: owner-only access, append-only (no update policy)
create policy "review_logs_select_own" on public.review_logs
  for select using (auth.uid() = user_id);
create policy "review_logs_insert_own" on public.review_logs
  for insert with check (auth.uid() = user_id);
create policy "review_logs_delete_own" on public.review_logs
  for delete using (auth.uid() = user_id);
