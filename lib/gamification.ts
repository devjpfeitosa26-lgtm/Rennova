export type ProfileRow = {
  id: string;
  name: string;
  level: number;
  xp: number;
  xp_to_next: number;
  current_streak: number;
  best_streak: number;
  last_activity_date: string | null;
};

/** Quanto de XP é preciso para sair do nível `level` para o próximo. */
export function xpRequiredFor(level: number) {
  return 100 + (level - 1) * 50;
}

/** Aplica um ganho de XP e resolve subidas de nível em cascata. */
export function applyXp(
  profile: Pick<ProfileRow, "xp" | "level" | "xp_to_next">,
  gained: number
) {
  let xp = profile.xp + gained;
  let level = profile.level;
  let xpToNext = profile.xp_to_next;
  let leveledUp = false;

  while (xp >= xpToNext) {
    xp -= xpToNext;
    level += 1;
    xpToNext = xpRequiredFor(level);
    leveledUp = true;
  }

  return { xp, level, xp_to_next: xpToNext, leveledUp };
}

/** Recalcula a sequência (streak) quando a primeira missão do dia é concluída. */
export function updateStreak(
  profile: Pick<ProfileRow, "current_streak" | "best_streak" | "last_activity_date">,
  todayISO: string
) {
  if (profile.last_activity_date === todayISO) {
    return {
      current_streak: profile.current_streak,
      best_streak: profile.best_streak,
      last_activity_date: todayISO,
    };
  }

  let current = 1;
  if (profile.last_activity_date) {
    const last = new Date(profile.last_activity_date + "T00:00:00Z").getTime();
    const today = new Date(todayISO + "T00:00:00Z").getTime();
    const diffDays = Math.round((today - last) / 86_400_000);
    current = diffDays === 1 ? profile.current_streak + 1 : 1;
  }

  return {
    current_streak: current,
    best_streak: Math.max(profile.best_streak, current),
    last_activity_date: todayISO,
  };
}

export function todayISO() {
  return new Date().toISOString().slice(0, 10);
}

export const MISSION_ORDER = ["treinar", "devocional", "leitura", "estudar"] as const;
