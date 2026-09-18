-- Remove unused decks.category column

alter table public.decks
  drop column category;
