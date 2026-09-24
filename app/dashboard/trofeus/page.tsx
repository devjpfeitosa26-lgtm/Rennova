import { createClient } from "@/lib/supabase/server";
import { checkMonthlyCleanAchievement } from "@/lib/achievements";
import { Lock, Sparkles, Medal, ShieldCheck } from "lucide-react";

const ICONS: Record<string, typeof Sparkles> = {
  sparkles: Sparkles,
  medal: Medal,
  "shield-check": ShieldCheck,
};

export default async function TrofeusPage() {
  const supabase = createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  const { data: profile } = await supabase
    .from("profiles")
    .select("created_at")
    .eq("id", user!.id)
    .single();

  if (profile) {
    await checkMonthlyCleanAchievement(supabase, user!.id, profile.created_at);
  }

  const [{ data: catalog }, { data: earned }] = await Promise.all([
    supabase.from("achievements").select("*").order("code"),
    supabase
      .from("user_achievements")
      .select("code, period, earned_at")
      .eq("user_id", user!.id),
  ]);

  const earnedMap = new Map(
    (earned ?? []).map((e) => [`${e.code}:${e.period}`, e.earned_at])
  );
  const earnedCodes = new Set((earned ?? []).map((e) => e.code));

  const oneTime = (catalog ?? []).filter((a) => !a.repeatable);
  const repeatable = (catalog ?? []).filter((a) => a.repeatable);
  const monthlyEarned = (earned ?? [])
    .filter((e) => e.code === "mes_limpo")
    .sort((a, b) => b.period.localeCompare(a.period));

  return (
    <div className="pt-6">
      <h2 className="mb-1 font-display text-xl italic text-text">Troféus</h2>
      <p className="mb-6 text-sm text-muted">
        {earnedCodes.size} de {oneTime.length + (repeatable.length > 0 ? 1 : 0)} conquistados
      </p>

      <div className="grid grid-cols-2 gap-2.5">
        {oneTime.map((a) => {
          const isEarned = earnedMap.has(`${a.code}:`);
          const Icon = ICONS[a.icon] ?? Sparkles;
          return (
            <div
              key={a.code}
              className={`rounded-md border px-3.5 py-4 ${
                isEarned ? "border-amber/30 bg-amber/10" : "border-line bg-surface opacity-60"
              }`}
            >
              <span
                className={`mb-2 flex h-9 w-9 items-center justify-center rounded-full ${
                  isEarned ? "bg-amber/20 text-amber" : "bg-surface2 text-muted"
                }`}
              >
                {isEarned ? <Icon size={16} /> : <Lock size={14} />}
              </span>
              <p className={`text-sm ${isEarned ? "text-text" : "text-muted"}`}>{a.label}</p>
              <p className="mt-0.5 text-xs text-muted">{a.description}</p>
            </div>
          );
        })}
      </div>

      {repeatable.length > 0 && (
        <div className="mt-6">
          <h3 className="mb-2.5 text-sm text-muted">Mês limpo</h3>
          {monthlyEarned.length === 0 ? (
            <p className="rounded-md border border-line bg-surface px-4 py-4 text-sm text-muted">
              Complete um mês inteiro sem recaídas para desbloquear seu primeiro
              troféu de mês limpo.
            </p>
          ) : (
            <ul className="space-y-2">
              {monthlyEarned.map((e) => (
                <li
                  key={e.period}
                  className="flex items-center gap-3 rounded-md border border-moss/30 bg-moss/10 px-4 py-3"
                >
                  <ShieldCheck size={16} className="text-moss-soft" />
                  <span className="text-sm text-text">Mês limpo — {formatPeriod(e.period)}</span>
                </li>
              ))}
            </ul>
          )}
        </div>
      )}
    </div>
  );
}

function formatPeriod(period: string) {
  const [year, month] = period.split("-").map(Number);
  const date = new Date(Date.UTC(year, month - 1, 1));
  return date.toLocaleDateString("pt-BR", { month: "long", year: "numeric", timeZone: "UTC" });
}
