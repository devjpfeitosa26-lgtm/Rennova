import Link from "next/link";
import { createClient } from "@/lib/supabase/server";
import { todayISO } from "@/lib/gamification";
import MissionList from "@/components/MissionList";

export default async function DashboardPage() {
  const supabase = createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  const today = todayISO();

  const [{ data: missions }, { data: completions }, { data: problems }] = await Promise.all([
    supabase.from("mission_types").select("id, label, base_xp").order("id"),
    supabase
      .from("daily_completions")
      .select("mission_id")
      .eq("user_id", user!.id)
      .eq("completion_date", today),
    supabase.from("problems").select("id").eq("user_id", user!.id).eq("active", true),
  ]);

  const order = ["treinar", "devocional", "leitura", "estudar"];
  const sorted = [...(missions ?? [])].sort((a, b) => order.indexOf(a.id) - order.indexOf(b.id));

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
        missions={sorted}
        doneIds={(completions ?? []).map((c) => c.mission_id)}
      />
    </div>
  );
}
