import { createClient } from "@/lib/supabase/server";
import ProblemsManager from "@/components/ProblemsManager";

export default async function ViciosPage() {
  const supabase = createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  const { data: problems } = await supabase
    .from("problems")
    .select("id, name, created_at")
    .eq("user_id", user!.id)
    .eq("active", true)
    .order("created_at", { ascending: false });

  return (
    <div className="pt-6">
      <h2 className="mb-1 font-display text-xl italic text-text">Seus desafios</h2>
      <p className="mb-6 text-sm text-muted">
        Cada recaída zera sua trilha inteira — mas você continua acompanhando
        os mesmos desafios.
      </p>
      <ProblemsManager initial={problems ?? []} />
    </div>
  );
}
