"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { Plus } from "lucide-react";

export default function CustomMissionForm() {
  const router = useRouter();
  const [open, setOpen] = useState(false);
  const [label, setLabel] = useState("");
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  async function submit(e: React.FormEvent) {
    e.preventDefault();
    const clean = label.trim();
    if (!clean) return;
    setLoading(true);
    setError(null);

    const res = await fetch("/api/missions", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ label: clean }),
    });
    const data = await res.json();
    setLoading(false);

    if (!res.ok) return setError(data.error ?? "Não foi possível criar a missão.");

    setLabel("");
    setOpen(false);
    router.refresh();
  }

  if (!open) {
    return (
      <button
        onClick={() => setOpen(true)}
        className="mt-4 flex w-full items-center justify-center gap-2 rounded-md border border-dashed border-line py-3.5 text-sm text-muted transition active:scale-[0.99]"
      >
        <Plus size={16} />
        Criar missão personalizada
      </button>
    );
  }

  return (
    <form onSubmit={submit} className="mt-4 rounded-md border border-line bg-surface p-4">
      <label className="mb-1.5 block text-sm text-muted">Nome da missão</label>
      <input
        autoFocus
        value={label}
        onChange={(e) => setLabel(e.target.value)}
        placeholder="Ex.: beber água, meditar, dormir cedo…"
        maxLength={40}
        className="input mb-3"
      />
      {error && <p className="mb-3 text-sm text-rust">{error}</p>}
      <div className="flex gap-2">
        <button
          type="button"
          onClick={() => setOpen(false)}
          className="flex-1 rounded-md border border-line py-2.5 text-sm text-text"
        >
          Cancelar
        </button>
        <button
          type="submit"
          disabled={loading || !label.trim()}
          className="flex-1 rounded-md bg-amber py-2.5 text-sm font-medium text-[#20150A] disabled:opacity-60"
        >
          {loading ? "Criando…" : "Criar (+15 XP)"}
        </button>
      </div>
    </form>
  );
}
