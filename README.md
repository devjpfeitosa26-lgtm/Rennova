# Renovva

App mobile-first e gamificado para ajudar pessoas a vencerem vícios: missões
diárias (treinar, devocional, leitura, estudar), níveis, XP e sequência de
dias — tudo é zerado se a pessoa registrar uma recaída.

Feito com **Next.js 14** (App Router) + **Supabase** (login e banco de
dados) + **Tailwind CSS**.

## 1. Criar o projeto no Supabase

1. Crie uma conta gratuita em [supabase.com](https://supabase.com) e crie um
   novo projeto.
2. Em **Authentication → Providers**, deixe **Email** ativado. Se quiser
   testar rápido sem confirmar e-mail, vá em **Authentication → Settings**
   e desative "Confirm email" (em produção, recomendo deixar ativado).
3. Vá em **SQL Editor**, abra uma nova query, cole o conteúdo do arquivo
   [`supabase/schema.sql`](./supabase/schema.sql) e rode.
4. Rode também [`supabase/migration_v2.sql`](./supabase/migration_v2.sql) em
   outra query — ele adiciona missões personalizadas, os devocionais e os
   troféus. É seguro rodar mesmo em um banco já em uso (não apaga nada).
5. Em **Project Settings → API**, copie a **Project URL** e a chave
   **anon public**.

## 2. Rodar localmente

```bash
npm install
cp .env.example .env.local
# cole a URL e a anon key do Supabase no .env.local
npm run dev
```

Abra http://localhost:3000.

## 3. Publicar no Vercel

1. Suba esta pasta para um repositório no GitHub (ou GitLab/Bitbucket).
2. No [vercel.com](https://vercel.com), clique em **Add New → Project** e
   importe o repositório.
3. Em **Environment Variables**, adicione:
   - `NEXT_PUBLIC_SUPABASE_URL`
   - `NEXT_PUBLIC_SUPABASE_ANON_KEY`
4. Clique em **Deploy**. Pronto — o Next.js é detectado automaticamente,
   não precisa configurar mais nada.

## Como funciona a gamificação

- **Missões diárias**: `treinar`, `devocional`, `leitura`, `estudar`, cada
  uma vale 20 XP (ajustável na tabela `mission_types`). Cada missão só pode
  ser concluída uma vez por dia.
- **Níveis**: o XP necessário para o próximo nível cresce a cada nível
  (`100 + (nível - 1) × 50`). A lógica fica em `lib/gamification.ts`.
- **Sequência (streak)**: conta dias seguidos com pelo menos uma missão
  concluída. Quebrar um dia zera a sequência atual (o recorde fica salvo).
- **Vícios/desafios**: cada usuário pode cadastrar quantos quiser em
  **Vícios**. Ao marcar "Recaí" em qualquer um deles, o progresso inteiro
  (nível, XP e sequência atual) é zerado — o histórico da recaída fica
  registrado na tabela `relapses` para estatísticas futuras.
- **Missões personalizadas**: além das 4 fixas, cada usuário pode criar até
  6 missões próprias (ex.: "beber água", "dormir cedo"), cada uma valendo
  15 XP. Ficam salvas na mesma tabela `mission_types`, só que com o
  `user_id` preenchido.
- **Devocional**: a missão "Devocional" abre uma página de leitura com um
  texto de C. H. Spurgeon (clássico protestante reformado, obra em domínio
  público desde 1892; os textos foram traduzidos livremente para este
  projeto). O ciclo tem 8 dias e se repete — dá para adicionar mais linhas
  na tabela `devotionals` a qualquer momento, seguindo o mesmo formato.
- **Troféus**: concedidos automaticamente ao subir de nível pela primeira
  vez e ao alcançar os níveis 5, 10, 15, 20, 25 e 30. O troféu "Mês limpo"
  (nenhuma recaída no mês) é conferido toda vez que o usuário abre a aba
  Troféus, olhando o mês calendário anterior.

## Próximos passos sugeridos

- Tela de perfil com histórico de recaídas e gráfico de evolução.
- Notificações/lembrete diário (push ou e-mail).
- Missões personalizadas por usuário, além das 4 fixas.
- Login social (Google) — o Supabase já suporta, é só ativar o provider.
