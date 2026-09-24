-- Renovva — migração v2 (rode DEPOIS do schema.sql)
-- Adiciona: missões personalizadas, devocionais e troféus/conquistas.

-- =========================================================
-- 1) Missões personalizadas
-- =========================================================
alter table mission_types
  add column if not exists user_id uuid references auth.users(id) on delete cascade,
  add column if not exists created_at timestamptz not null default now();

-- Permite que cada usuário crie e veja suas próprias missões, além das fixas (user_id is null)
drop policy if exists "mission_types: read all" on mission_types;
create policy "mission_types: read own and system" on mission_types
  for select using (user_id is null or auth.uid() = user_id);
create policy "mission_types: insert own" on mission_types
  for insert with check (auth.uid() = user_id);
create policy "mission_types: delete own" on mission_types
  for delete using (auth.uid() = user_id);

-- =========================================================
-- 2) Devocionais
-- =========================================================
create table if not exists devotionals (
  id serial primary key,
  day_index int not null unique,
  title text not null,
  author text not null,
  source text not null,
  scripture_ref text not null,
  scripture_text text not null,
  body text not null
);

alter table devotionals enable row level security;
drop policy if exists "devotionals: read all" on devotionals;
create policy "devotionals: read all" on devotionals for select using (true);

-- 8 devocionais de C. H. Spurgeon (obra em domínio público — "Morning and
-- Evening", 1866), traduzidos livremente. O ciclo se repete a cada 8 dias;
-- dá para adicionar mais linhas depois com o mesmo formato.
insert into devotionals (day_index, title, author, source, scripture_ref, scripture_text, body) values
(1, 'O fruto da nova terra', 'Charles H. Spurgeon', 'Manhã e Tarde (tradução livre)', 'Josué 5:12', 'Comeram do fruto da terra de Canaã naquele ano.',
'As fatigantes peregrinações de Israel haviam terminado, e o descanso prometido fora alcançado. Não mais tendas errantes, serpentes ardentes, inimigos ferozes e desertos uivantes: eles chegaram à terra que mana leite e mel, e comeram do trigo antigo da terra.

Talvez este ano, querido leitor, seja também o seu caso, ou o meu. A perspectiva é alegre, e se a fé estiver em exercício ativo, ela produzirá um deleite genuíno. Estar com Jesus no descanso que resta para o povo de Deus é, de fato, uma esperança animadora.

Colheremos este ano frutos celestiais em solo terreno, onde a fé e a esperança transformaram o deserto no jardim do Senhor. Ó, que a graça nos faça alimentar de Jesus, e assim comer do fruto da terra nova este ano!'),

(2, 'Alegria antes de tudo', 'Charles H. Spurgeon', 'Manhã e Tarde (tradução livre)', 'Cântico dos Cânticos 1:4', 'Nos alegraremos e nos regozijaremos em ti.',
'Nos alegraremos e nos regozijaremos em ti. Não abriremos os portões do dia ao som pesaroso da queixa, mas às doces melodias da alegria e aos címbalos ressoantes do júbilo.

Nós, os chamados, fiéis e escolhidos, afastaremos as nossas tristezas e ergueremos as bandeiras da nossa confiança no nome de Deus. Que outros lamentem suas aflições — nós, que temos onde lançar as nossas águas amargas, com alegria engrandeceremos o Senhor.

Já que tu, Senhor, és a porção presente do teu povo, concede-nos hoje tal sentido da tua bondade que, do primeiro ao último momento, possamos nos alegrar e regozijar em ti.'),

(3, 'Um caminho preparado', 'Charles H. Spurgeon', 'Manhã e Tarde (tradução livre)', 'Lucas 3:4', 'Preparai o caminho do Senhor, endireitai as suas veredas.',
'A voz que clama no deserto exigia um caminho para o Senhor — um caminho preparado, e preparado justamente no deserto. Que eu esteja atento a essa proclamação, e abra uma estrada até o meu coração, erguida pelas operações da graça através do deserto da minha própria natureza.

Todo vale deve ser levantado: pensamentos baixos e rasteiros a respeito de Deus devem ser abandonados; a dúvida e o desespero devem ser removidos. Todo monte deve ser nivelado: a suficiência orgulhosa e a autojustiça devem ser aplainadas, para abrir caminho ao Rei dos reis.

Que hoje o Senhor encontre em meu coração uma estrada preparada pela sua graça, para que ele possa avançar por todos os confins da minha alma, do início deste dia até o seu fim.'),

(4, 'Tudo o que precisas', 'Charles H. Spurgeon', 'Manhã e Tarde (tradução livre)', 'Jeremias 31:33', 'Eu serei o seu Deus.',
'Aqui está tudo o que precisas. Para seres feliz, precisas de algo que te satisfaça plenamente — e não é isto suficiente? Se puderes guardar esta promessa no coração, não dirás, como Davi: "O meu cálice transborda; tenho mais do que o coração pode desejar"?

O desejo humano é insaciável, mas aquele que enche todas as coisas pode enchê-lo. Quem pode medir a capacidade dos nossos anseios? Mas a riqueza de Deus pode transbordá-la ainda mais. Não estás completo quando Deus é teu? Precisas de algo além dele?

Vive à altura dos teus privilégios, e regozija-te com alegria genuína.'),

(5, 'Eu te ajudarei', 'Charles H. Spurgeon', 'Manhã e Tarde (tradução livre)', 'Isaías 41:14', 'Eu te ajudarei, diz o Senhor.',
'Hoje, ouçamos o Senhor falar a cada um de nós: "Eu te ajudarei."

"É pouca coisa, para mim, ajudar-te. Considera o que já fiz por ti. Eu te comprei com o meu sangue; morri por ti — e se fiz o maior, não farei o menor? Ajudar-te é a menor coisa que ainda farei por ti; já fiz mais, e farei mais."

"Antes que o mundo existisse, eu te escolhi. Deixei de lado a minha glória por ti; entreguei a minha vida por ti; e se fiz tudo isso, certamente te ajudarei agora. Ao te ajudar, estou apenas te dando o que já conquistei para ti."

O Deus eterno é o teu ajudador — hoje, de novo.'),

(6, 'Onde perdeste o caminho', 'Charles H. Spurgeon', 'Manhã e Tarde (tradução livre)', 'Cântico dos Cânticos 3:1', 'Busquei-o, mas não o achei.',
'Diz-me onde perdeste a paz, e eu te direi o lugar mais provável para encontrá-la de novo.

Perdeste-a por teres deixado de orar? Então é ali que deves buscá-la. Perdeste-a pelo erro que cometeste? Não a encontrarás de outra forma senão reconhecendo o erro e buscando, com ajuda, deixar para trás aquilo que te derruba. Perdeste-a por teres se afastado do que te fortalece? É ali que deves voltar a buscar.

É um ditado verdadeiro: procura uma coisa onde a deixaste cair, pois é ali que ela está. É trabalho árduo voltar atrás — mas busca de todo o coração, entrega-te inteiramente à busca, e em verdade encontrarás de novo o teu caminho, para tua alegria.'),

(7, 'As correntes que se quebram', 'Charles H. Spurgeon', 'Manhã e Tarde (tradução livre)', 'Isaías 63:7', 'Mencionarei as bondades do Senhor, e tudo o que ele tem concedido.',
'E não podes tu fazer o mesmo? Não há bondades que já experimentaste? Ainda que estejas abatido agora, podes esquecer aquela hora em que foste encontrado e ouviste: "Vem"?

Não podes lembrar aquele momento em que as tuas correntes foram quebradas, os teus grilhões lançados por terra, e ouviste: "Vim para romper os teus laços e te libertar"? Se já esqueceste o amor dos teus primeiros passos, certamente há algum marco precioso ao longo do caminho, ainda não coberto pelo tempo, onde podes ler um memorial feliz dessa bondade para contigo.

O que já te derrubou antes, e do qual foste restaurado — não é prova de que podes ser restaurado outra vez?'),

(8, 'Olhar para frente', 'Charles H. Spurgeon', 'Manhã e Tarde (tradução livre)', '2 Coríntios 4:18', 'As coisas que não se veem são eternas.',
'Em nossa caminhada, convém, na maior parte do tempo, olhar para frente. Adiante está a meta. Seja para esperança, para alegria ou para consolo, o futuro deve ser o grande objeto dos olhos da fé.

Olhando para o futuro, vemos o que hoje pesa sendo finalmente deixado para trás, a pessoa que queremos ser sendo formada aos poucos, apta a viver uma vida plena.

A visão clara da fé há de sustentar-nos até que esta caminhada termine; temores podem afligir e tribulações podem doer, mas, ainda assim, seguimos — um dia de cada vez.')
on conflict (day_index) do nothing;

-- =========================================================
-- 3) Troféus / conquistas
-- =========================================================
create table if not exists achievements (
  code text primary key,
  label text not null,
  description text not null,
  icon text not null,
  repeatable boolean not null default false
);

insert into achievements (code, label, description, icon, repeatable) values
  ('primeira_subida', 'Primeiro passo', 'Você subiu de nível pela primeira vez.', 'sparkles', false),
  ('nivel_5', 'Nível 5', 'Alcançou o nível 5 da sua trilha.', 'medal', false),
  ('nivel_10', 'Nível 10', 'Alcançou o nível 10 da sua trilha.', 'medal', false),
  ('nivel_15', 'Nível 15', 'Alcançou o nível 15 da sua trilha.', 'medal', false),
  ('nivel_20', 'Nível 20', 'Alcançou o nível 20 da sua trilha.', 'medal', false),
  ('nivel_25', 'Nível 25', 'Alcançou o nível 25 da sua trilha.', 'medal', false),
  ('nivel_30', 'Nível 30', 'Alcançou o nível 30 da sua trilha.', 'medal', false),
  ('mes_limpo', 'Mês limpo', 'Um mês inteiro sem nenhuma recaída registrada.', 'shield-check', true)
on conflict (code) do nothing;

create table if not exists user_achievements (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  code text not null references achievements(code),
  period text not null default '',
  earned_at timestamptz not null default now(),
  unique (user_id, code, period)
);

alter table user_achievements enable row level security;
drop policy if exists "user_achievements: select own" on user_achievements;
create policy "user_achievements: select own" on user_achievements for select using (auth.uid() = user_id);
drop policy if exists "user_achievements: insert own" on user_achievements;
create policy "user_achievements: insert own" on user_achievements for insert with check (auth.uid() = user_id);

alter table achievements enable row level security;
drop policy if exists "achievements: read all" on achievements;
create policy "achievements: read all" on achievements for select using (true);
