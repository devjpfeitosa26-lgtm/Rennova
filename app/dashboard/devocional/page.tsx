import Link from "next/link";
import { ChevronLeft } from "lucide-react";
import { createClient } from "@/lib/supabase/server";
import { todayISO } from "@/lib/gamification";
import DevotionalComplete from "@/components/DevotionalComplete";

function dayOfYear(date: Date) {
  const start = Date.UTC(date.getUTCFullYear(), 0, 0);
  const diff = Date.UTC(date.getUTCFullYear(), date.getUTCMonth(), date.getUTCDate()) - start;
  return Math.floor(diff / 86_400_000);
}

export default async function DevocionalPage() {
  const supabase = createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  const { count } = await supabase
    .from("devotionals")
    .select("id", { count: "exact", head: true });

  const total = count ?? 0;
  const today = todayISO();
  let devotional = null;

  if (total > 0) {
    const index = (dayOfYear(new Date()) % total) + 1;
    const { data } = await supabase
      .from("devotionals")
      .select("*")
      .eq("day_index", index)
      .maybeSingle();
    devotional = data;
  }

  const { data: existing } = await supabase
    .from("daily_completions")
    .select("id")
    .eq("user_id", user!.id)
    .eq("mission_id", "devocional")
    .eq("completion_date", today)
    .maybeSingle();

  return (
    <div className="pt-6">
      <Link href="/dashboard" className="mb-6 flex items-center gap-1 text-sm text-muted">
        <ChevronLeft size={16} />
        voltar
      </Link>

      {!devotional ? (
        <p className="rounded-md border border-line bg-surface px-4 py-6 text-center text-sm text-muted">
          Nenhum devocional cadastrado ainda.
        </p>
      ) : (
        <article>
          <p className="mb-2 text-xs uppercase tracking-wide text-muted">
            {devotional.author} · {devotional.source}
          </p>
          <h1 className="mb-4 font-display text-2xl italic text-text">{devotional.title}</h1>

          <div className="mb-5 rounded-md border-l-2 border-amber bg-surface px-4 py-3">
            <p className="text-sm italic text-amber-soft">“{devotional.scripture_text}”</p>
            <p className="mt-1 text-xs text-muted">{devotional.scripture_ref}</p>
          </div>

          <div className="space-y-4 text-[0.98rem] leading-relaxed text-text/90">
            {devotional.body.split("\n\n").map((p: string, i: number) => (
              <p key={i}>{p}</p>
            ))}
          </div>

          <div className="mt-8">
            <DevotionalComplete alreadyDone={!!existing} />
          </div>
        </article>
      )}
    </div>
  );
}
