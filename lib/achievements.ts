import type { SupabaseClient } from "@supabase/supabase-js";

export const LEVEL_MILESTONES = [5, 10, 15, 20, 25, 30] as const;

const LABELS: Record<string, string> = {
  primeira_subida: "Primeiro passo",
  nivel_5: "Nível 5",
  nivel_10: "Nível 10",
  nivel_15: "Nível 15",
  nivel_20: "Nível 20",
  nivel_25: "Nível 25",
  nivel_30: "Nível 30",
  mes_limpo: "Mês limpo",
};

/**
 * Concede conquistas de nível (primeira subida + marcos de nível) quando
 * aplicável. Chamado depois de um ganho de XP que pode ter subido o nível.
 * Retorna os rótulos das conquistas recém-obtidas (para exibir um aviso).
 */
export async function awardLevelAchievements(
  supabase: SupabaseClient,
  userId: string,
  oldLevel: number,
  newLevel: number,
  leveledUp: boolean
): Promise<string[]> {
  if (!leveledUp) return [];

  const codes: string[] = ["primeira_subida"];
  for (const milestone of LEVEL_MILESTONES) {
    if (milestone > oldLevel && milestone <= newLevel) {
      codes.push(`nivel_${milestone}`);
    }
  }

  const earned: string[] = [];
  for (const code of codes) {
    const { error } = await supabase
      .from("user_achievements")
      .insert({ user_id: userId, code, period: "" });
    if (!error) earned.push(LABELS[code] ?? code);
  }
  return earned;
}

/**
 * Confere se o mês passado (calendário) terminou sem nenhuma recaída, e
 * concede o troféu "Mês limpo" se ainda não tiver sido dado para esse mês.
 * Seguro para chamar em toda visita à página de troféus (idempotente).
 */
export async function checkMonthlyCleanAchievement(
  supabase: SupabaseClient,
  userId: string,
  accountCreatedAt: string
) {
  const now = new Date();
  const firstOfThisMonth = new Date(Date.UTC(now.getUTCFullYear(), now.getUTCMonth(), 1));
  const firstOfLastMonth = new Date(
    Date.UTC(now.getUTCFullYear(), now.getUTCMonth() - 1, 1)
  );
  const period = `${firstOfLastMonth.getUTCFullYear()}-${String(
    firstOfLastMonth.getUTCMonth() + 1
  ).padStart(2, "0")}`;

  const createdAt = new Date(accountCreatedAt);
  if (createdAt >= firstOfThisMonth) return; // conta é nova demais, ainda não fechou um mês

  const { count } = await supabase
    .from("relapses")
    .select("id", { count: "exact", head: true })
    .eq("user_id", userId)
    .gte("created_at", firstOfLastMonth.toISOString())
    .lt("created_at", firstOfThisMonth.toISOString());

  if ((count ?? 0) === 0) {
    await supabase
      .from("user_achievements")
      .insert({ user_id: userId, code: "mes_limpo", period });
    // erro de conflito (já concedido) é esperado e ignorado
  }
}
