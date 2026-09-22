-- Renovva — schema do banco (rode isso no SQL Editor do Supabase)

create extension if not exists "pgcrypto";

-- Perfil de jogo do usuário (1 por usuário)
create table if not exists profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  name text not null default '',
  level int not null default 1,
  xp int not null default 0,
  xp_to_next int not null default 100,
  current_streak int not null default 0,
  best_streak int not null default 0,
  last_activity_date date,
  created_at timestamptz not null default now()
);

-- Vícios / problemas que o usuário está enfrentando (pode ter vários)
create table if not exists problems (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  name text not null,
  active boolean not null default true,
  created_at timestamptz not null default now()
);

-- Catálogo fixo de missões diárias
create table if not exists mission_types (
  id text primary key,
  label text not null,
  icon text not null,
  base_xp int not null default 20
);

insert into mission_types (id, label, icon, base_xp) values
  ('treinar', 'Treinar', 'dumbbell', 20),
  ('devocional', 'Devocional', 'flame', 20),
  ('leitura', 'Leitura', 'book', 20),
  ('estudar', 'Estudar', 'brain', 20)
on conflict (id) do nothing;

-- Missões concluídas por dia (1 registro por usuário/missão/dia)
create table if not exists daily_completions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  mission_id text not null references mission_types(id),
  completion_date date not null default (now() at time zone 'utc')::date,
  xp_earned int not null,
  created_at timestamptz not null default now(),
  unique (user_id, mission_id, completion_date)
);

-- Histórico de recaídas (guarda o "antes" do reset, para estatísticas)
create table if not exists relapses (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  problem_id uuid references problems(id) on delete set null,
  note text,
  xp_before int not null,
  level_before int not null,
  streak_before int not null,
  created_at timestamptz not null default now()
);

-- Cria o perfil automaticamente quando um usuário se cadastra
create or replace function public.handle_new_user()
returns trigger as $$
begin
  insert into public.profiles (id, name)
  values (new.id, coalesce(new.raw_user_meta_data->>'name', ''));
  return new;
end;
$$ language plpgsql security definer set search_path = public;

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();

-- Row Level Security: cada usuário só enxerga e altera os próprios dados
alter table profiles enable row level security;
alter table problems enable row level security;
alter table daily_completions enable row level security;
alter table relapses enable row level security;
alter table mission_types enable row level security;

create policy "profiles: select own" on profiles for select using (auth.uid() = id);
create policy "profiles: update own" on profiles for update using (auth.uid() = id);

create policy "problems: select own" on problems for select using (auth.uid() = user_id);
create policy "problems: insert own" on problems for insert with check (auth.uid() = user_id);
create policy "problems: update own" on problems for update using (auth.uid() = user_id);
create policy "problems: delete own" on problems for delete using (auth.uid() = user_id);

create policy "completions: select own" on daily_completions for select using (auth.uid() = user_id);
create policy "completions: insert own" on daily_completions for insert with check (auth.uid() = user_id);

create policy "relapses: select own" on relapses for select using (auth.uid() = user_id);
create policy "relapses: insert own" on relapses for insert with check (auth.uid() = user_id);

create policy "mission_types: read all" on mission_types for select using (true);
