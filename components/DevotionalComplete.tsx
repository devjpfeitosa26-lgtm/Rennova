"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { Check, PartyPopper, Trophy } from "lucide-react";

export default function DevotionalComplete({ alreadyDone }: { alreadyDone: boolean }) {
  const router = useRouter();
  const [done, setDone] = useState(alreadyDone);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [toast, setToast] = useState<string | null>(null);

  async function complete() {
    if (done || loading) return;
    setLoading(true);
    setError(null);

    const res = await fetch("/api/missions/complete", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ missionId: "devocional" }),
    });
    const data = await res.json();
    setLoading(false);

    if (!res.ok) {
      setError(data.error ?? "Não deu para concluir agora.");
      return;
    }

    setDone(true);
    if (data.newAchievements?.length) {
      setToast(`Troféu desbloqueado: ${data.newAchievements[0]}`);
    } else if (data.leveledUp) {
      setToast("Você subiu de nível!");
    }
    router.refresh();
  }

  if (done) {
    return (
      <div className="flex items-center gap-2 rounded-md border border-moss/30 bg-moss/10 px-4 py-3.5 text-sm text-moss-soft">
        <Check size={16} />
        Devocional concluído hoje.
        {toast && (
          <span className="ml-auto flex items-center gap-1 text-amber">
            {toast.startsWith("Troféu") ? <Trophy size={14} /> : <PartyPopper size={14} />}
            {toast}
          </span>
        )}
      </div>
    );
  }

  return (
    <div>
      <button
        onClick={complete}
        disabled={loading}
        className="w-full rounded-md bg-amber px-5 py-3.5 text-center font-medium text-[#20150A] transition active:scale-[0.98] disabled:opacity-60"
      >
        {loading ? "Registrando…" : "Concluir devocional de hoje"}
      </button>
      {error && <p className="mt-2 text-center text-sm text-rust">{error}</p>}
    </div>
  );
}
