-- Align FSRS column names with ts-fsrs Card fields.

alter table public.cards
  rename column due_date to due;

alter table public.cards
  rename column last_reviewed_at to last_review;

alter table public.cards
  rename column repetitions to reps;

alter table public.cards
  rename column interval to scheduled_days;

-- Keep the index name aligned with the renamed due-date column.
drop index if exists public.cards_due_date_idx;

create index cards_due_idx on public.cards (due);
