"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { Plus, ShieldAlert, X } from "lucide-react";

type Problem = { id: string; name: string; created_at: string };

export default function ProblemsManager({ initial }: { initial: Problem[] }) {
  const router = useRouter();
  const [problems, setProblems] = useState(initial);
  const [newName, setNewName] = useState("");
  const [adding, setAdding] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [confirmingId, setConfirmingId] = useState<string | null>(null);
  const [note, setNote] = useState("");
  const [submittingRelapse, setSubmittingRelapse] = useState(false);

  async function addProblem(e: React.FormEvent) {
    e.preventDefault();
    const name = newName.trim();
    if (!name) return;
    setAdding(true);
    setError(null);

    const res = await fetch("/api/problems", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ name }),
    });
    const data = await res.json();
    setAdding(false);

    if (!res.ok) return setError(data.error ?? "Não foi possível adicionar.");

    setProblems((prev) => [data.problem, ...prev]);
    setNewName("");
  }

  async function confirmRelapse(problemId: string) {
    setSubmittingRelapse(true);
    const res = await fetch("/api/relapse", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ problemId, note: note.trim() || null }),
    });
    setSubmittingRelapse(false);

    if (res.ok) {
      setConfirmingId(null);
      setNote("");
      router.refresh();
    }
  }

  return (
    <div>
      <form onSubmit={addProblem} className="mb-6 flex gap-2">
        <input
          value={newName}
          onChange={(e) => setNewName(e.target.value)}
          placeholder="Ex.: álcool, jogos, redes sociais…"
          className="input"
          maxLength={60}
        />
        <button
          type="submit"
          disabled={adding || !newName.trim()}
          aria-label="Adicionar desafio"
          className="flex shrink-0 items-center justify-center rounded-md bg-amber px-4 text-[#20150A] disabled:opacity-50"
        >
          <Plus size={20} />
        </button>
      </form>
      {error && <p className="-mt-4 mb-4 text-sm text-rust">{error}</p>}

      {problems.length === 0 ? (
        <p className="rounded-md border border-line bg-surface px-4 py-6 text-center text-sm text-muted">
          Nenhum desafio registrado ainda. Adicione o que você está enfrentando
          para acompanhar seu progresso.
        </p>
      ) : (
        <ul className="space-y-2.5">
          {problems.map((p) => (
            <li
              key={p.id}
              className="rounded-md border border-line bg-surface px-4 py-4"
            >
              <div className="flex items-center justify-between gap-3">
                <div className="min-w-0">
                  <p className="truncate text-text">{p.name}</p>
                  <p className="text-xs text-muted">
                    desde {new Date(p.created_at).toLocaleDateString("pt-BR")}
                  </p>
                </div>
                <button
                  onClick={() => setConfirmingId(p.id)}
                  className="flex shrink-0 items-center gap-1.5 rounded-md border border-rust/40 px-3 py-2 text-xs text-rust transition active:scale-95"
                >
                  <ShieldAlert size={14} />
                  Recaí
                </button>
              </div>
            </li>
          ))}
        </ul>
      )}

      {confirmingId && (
        <div className="fixed inset-0 z-30 flex items-end justify-center bg-black/60 px-6 pb-6 backdrop-blur-sm">
          <div className="w-full max-w-md rounded-lg border border-line bg-surface p-5">
            <div className="mb-3 flex items-start justify-between">
              <h3 className="font-display text-lg italic text-text">
                Registrar recaída
              </h3>
              <button
                onClick={() => setConfirmingId(null)}
                aria-label="Fechar"
                className="text-muted"
              >
                <X size={18} />
              </button>
            </div>
            <p className="mb-4 text-sm text-muted">
              Isso vai zerar seu nível, XP e sequência atual. Seu recorde de
              sequência fica guardado. Recomeçar faz parte do processo.
            </p>
            <textarea
              value={note}
              onChange={(e) => setNote(e.target.value)}
              placeholder="Quer anotar o que aconteceu? (opcional)"
              rows={3}
              className="input mb-4 resize-none"
            />
            <div className="flex gap-3">
              <button
                onClick={() => setConfirmingId(null)}
                className="flex-1 rounded-md border border-line px-4 py-3 text-sm text-text"
              >
                Cancelar
              </button>
              <button
                onClick={() => confirmRelapse(confirmingId)}
                disabled={submittingRelapse}
                className="flex-1 rounded-md bg-rust px-4 py-3 text-sm text-white disabled:opacity-60"
              >
                {submittingRelapse ? "Registrando…" : "Confirmar e recomeçar"}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
