-- Preserve review_logs when the referenced card is deleted (deck deletion cascades to cards).
-- card_id becomes nullable so orphaned logs remain instead of being removed.

alter table public.review_logs
  alter column card_id drop not null;

alter table public.review_logs
  drop constraint review_logs_card_id_fkey;

alter table public.review_logs
  add constraint review_logs_card_id_fkey
  foreign key (card_id) references public.cards (id) on delete set null;
