import Link from "next/link";

export default function Home() {
  return (
    <main className="mx-auto flex min-h-dvh max-w-md flex-col px-6 pb-10 pt-[max(2.5rem,env(safe-area-inset-top))]">
      <div className="flex items-center gap-2">
        <span className="h-2 w-2 rounded-full bg-amber" />
        <span className="text-sm tracking-wide text-muted">renovva</span>
      </div>

      <div className="mt-16 flex-1">
        <h1 className="font-display text-[2.75rem] italic leading-[1.05] text-text">
          Um dia de cada vez
          <br />
          <span className="not-italic text-amber">tem nível.</span>
        </h1>
        <p className="mt-6 max-w-[34ch] text-[1.05rem] leading-relaxed text-muted">
          Renovva transforma sua recuperação em uma trilha: você cumpre
          missões diárias, ganha experiência e sobe de nível. Se cair, a
          trilha recomeça — mas você já sabe o caminho.
        </p>
      </div>

      <div className="mt-10 space-y-6">
        <div className="flex gap-6 border-t border-line pt-6 text-sm text-muted">
          <div>
            <p className="font-display text-2xl text-text">4</p>
            <p>missões por dia</p>
          </div>
          <div>
            <p className="font-display text-2xl text-text">∞</p>
            <p>vícios acompanhados</p>
          </div>
          <div>
            <p className="font-display text-2xl text-text">1</p>
            <p>recomeço, sem culpa</p>
          </div>
        </div>

        <div className="flex flex-col gap-3">
          <Link
            href="/cadastro"
            className="rounded-md bg-amber px-5 py-3.5 text-center font-medium text-[#20150A] transition active:scale-[0.98]"
          >
            Começar minha trilha
          </Link>
          <Link
            href="/login"
            className="rounded-md border border-line px-5 py-3.5 text-center font-medium text-text transition active:scale-[0.98]"
          >
            Já tenho conta
          </Link>
        </div>
      </div>
    </main>
  );
}
