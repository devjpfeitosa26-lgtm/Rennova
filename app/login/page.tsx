import Link from "next/link";
import AuthForm from "@/components/AuthForm";

export default function LoginPage() {
  return (
    <main className="mx-auto flex min-h-dvh max-w-md flex-col px-6 pb-10 pt-[max(3rem,env(safe-area-inset-top))]">
      <Link href="/" className="text-sm text-muted">
        ← voltar
      </Link>

      <h1 className="mt-8 font-display text-3xl italic text-text">
        Continue sua trilha
      </h1>
      <p className="mt-2 text-muted">Entre para ver seu progresso de hoje.</p>

      <div className="mt-8">
        <AuthForm mode="login" />
      </div>

      <p className="mt-6 text-center text-sm text-muted">
        Ainda não tem conta?{" "}
        <Link href="/cadastro" className="text-amber">
          Criar conta
        </Link>
      </p>
    </main>
  );
}
