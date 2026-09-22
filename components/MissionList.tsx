"use client";

import { useState, useTransition } from "react";
import { useRouter } from "next/navigation";
import { Dumbbell, Sunrise, BookOpen, GraduationCap, Check, PartyPopper } from "lucide-react";

const ICONS: Record<string, typeof Dumbbell> = {
  treinar: Dumbbell,
  devocional: Sunrise,
  leitura: BookOpen,
  estudar: GraduationCap,
};

type Mission = { id: string; label: string; base_xp: number };

export default function MissionList({
  missions,
  doneIds,
}: {
  missions: Mission[];
  doneIds: string[];
}) {
  const router = useRouter();
  const [done, setDone] = useState(new Set(doneIds));
  const [pendingId, setPendingId] = useState<string | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [levelUp, setLevelUp] = useState(false);
  const [, startTransition] = useTransition();

  async function complete(missionId: string) {
    if (done.has(missionId) || pendingId) return;
    setPendingId(missionId);
    setError(null);

    const res = await fetch("/api/missions/complete", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ missionId }),
    });
    const data = await res.json();

    setPendingId(null);

    if (!res.ok) {
      setError(data.error ?? "Não deu pra concluir agora.");
      return;
    }

    setDone((prev) => new Set(prev).add(missionId));
    if (data.leveledUp) {
      setLevelUp(true);
      setTimeout(() => setLevelUp(false), 2600);
    }
    startTransition(() => router.refresh());
  }

  const allDone = missions.length > 0 && missions.every((m) => done.has(m.id));

  return (
    <div className="relative">
      {levelUp && (
        <div className="animate-pop-in absolute -top-3 left-1/2 z-20 flex -translate-x-1/2 items-center gap-2 rounded-md border border-amber/40 bg-surface px-4 py-2 text-sm text-amber shadow-lg">
          <PartyPopper size={16} />
          Você subiu de nível!
        </div>
      )}

      <div className="space-y-2.5">
        {missions.map((mission) => {
          const Icon = ICONS[mission.id] ?? Dumbbell;
          const isDone = done.has(mission.id);
          const isPending = pendingId === mission.id;

          return (
            <button
              key={mission.id}
              onClick={() => complete(mission.id)}
              disabled={isDone || !!pendingId}
              className={`flex w-full items-center gap-3.5 rounded-md border px-4 py-4 text-left transition active:scale-[0.99] ${
                isDone
                  ? "border-moss/30 bg-moss/10"
                  : "border-line bg-surface disabled:opacity-60"
              }`}
            >
              <span
                className={`flex h-10 w-10 shrink-0 items-center justify-center rounded-full ${
                  isDone ? "bg-moss/20 text-moss-soft" : "bg-surface2 text-muted"
                }`}
              >
                {isDone ? <Check size={18} /> : <Icon size={18} />}
              </span>
              <span className="min-w-0 flex-1">
                <span className={`block ${isDone ? "text-moss-soft line-through" : "text-text"}`}>
                  {mission.label}
                </span>
                <span className="text-xs text-muted">
                  {isPending ? "Registrando…" : `+${mission.base_xp} XP`}
                </span>
              </span>
            </button>
          );
        })}
      </div>

      {error && <p className="mt-3 text-sm text-rust">{error}</p>}

      {allDone && (
        <p className="mt-5 text-center text-sm text-muted">
          Trilha de hoje completa. Volte amanhã para continuar a sequência.
        </p>
      )}
    </div>
  );
}
