import Link from "next/link";
import AuthForm from "@/components/AuthForm";

export default function CadastroPage() {
  return (
    <main className="mx-auto flex min-h-dvh max-w-md flex-col px-6 pb-10 pt-[max(3rem,env(safe-area-inset-top))]">
      <Link href="/" className="text-sm text-muted">
        ← voltar
      </Link>

      <h1 className="mt-8 font-display text-3xl italic text-text">
        Comece sua trilha
      </h1>
      <p className="mt-2 text-muted">
        Depois de criar a conta, você escolhe os desafios que quer vencer.
      </p>

      <div className="mt-8">
        <AuthForm mode="cadastro" />
      </div>

      <p className="mt-6 text-center text-sm text-muted">
        Já tem conta?{" "}
        <Link href="/login" className="text-amber">
          Entrar
        </Link>
      </p>
    </main>
  );
}
