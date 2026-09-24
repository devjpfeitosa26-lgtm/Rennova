import Link from "next/link";
import { createClient } from "@/lib/supabase/server";
import { todayISO } from "@/lib/gamification";
import MissionList from "@/components/MissionList";
import CustomMissionForm from "@/components/CustomMissionForm";

export default async function DashboardPage() {
  const supabase = createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  const today = todayISO();

  const [{ data: missions }, { data: completions }, { data: problems }] = await Promise.all([
    supabase
      .from("mission_types")
      .select("id, label, base_xp, user_id")
      .or(`user_id.is.null,user_id.eq.${user!.id}`)
      .order("created_at"),
    supabase
      .from("daily_completions")
      .select("mission_id")
      .eq("user_id", user!.id)
      .eq("completion_date", today),
    supabase.from("problems").select("id").eq("user_id", user!.id).eq("active", true),
  ]);

  const order = ["treinar", "devocional", "leitura", "estudar"];
  const sorted = [...(missions ?? [])].sort((a, b) => {
    const ai = order.indexOf(a.id);
    const bi = order.indexOf(b.id);
    if (ai !== -1 && bi !== -1) return ai - bi;
    if (ai !== -1) return -1;
    if (bi !== -1) return 1;
    return 0;
  });

  return (
    <div className="pt-6">
      {(!problems || problems.length === 0) && (
        <Link
          href="/dashboard/vicios"
          className="mb-6 block rounded-md border border-amber/30 bg-amber/10 px-4 py-3.5 text-sm text-amber-soft"
        >
          Você ainda não registrou nenhum desafio.{" "}
          <span className="text-amber underline">Adicionar agora →</span>
        </Link>
      )}

      <h2 className="mb-4 font-display text-xl italic text-text">Trilha de hoje</h2>

      <MissionList
        missions={sorted.map((m) => ({ ...m, custom: !!m.user_id }))}
        doneIds={(completions ?? []).map((c) => c.mission_id)}
      />

      <CustomMissionForm />
    </div>
  );
}
