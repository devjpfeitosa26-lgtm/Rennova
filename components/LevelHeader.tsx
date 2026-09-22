import { Flame } from "lucide-react";

export default function LevelHeader({
  level,
  xp,
  xpToNext,
  streak,
}: {
  level: number;
  xp: number;
  xpToNext: number;
  streak: number;
}) {
  const pct = Math.min(100, Math.round((xp / xpToNext) * 100));

  return (
    <div className="flex items-center gap-4">
      <div className="relative flex h-16 w-16 shrink-0 items-center justify-center rounded-full border-2 border-amber/40">
        <span className="font-display text-2xl text-amber">{level}</span>
      </div>

      <div className="min-w-0 flex-1">
        <div className="mb-1.5 flex items-baseline justify-between">
          <span className="text-sm text-muted">Nível {level}</span>
          <span className="flex items-center gap-1 text-sm text-amber-soft">
            <Flame size={14} className="fill-amber-soft text-amber-soft" />
            {streak} {streak === 1 ? "dia" : "dias"}
          </span>
        </div>
        <div className="h-2 w-full overflow-hidden rounded-full bg-surface2">
          <div
            className="h-full rounded-full bg-gradient-to-r from-moss to-amber"
            style={{ width: `${pct}%` }}
          />
        </div>
        <p className="mt-1 text-xs text-muted">
          {xp} / {xpToNext} XP para o nível {level + 1}
        </p>
      </div>
    </div>
  );
}
