import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import LevelHeader from "@/components/LevelHeader";
import LogoutButton from "@/components/LogoutButton";
import BottomNav from "@/components/BottomNav";

export default async function DashboardLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  const supabase = createClient();

  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) redirect("/login");

  const { data: profile } = await supabase
    .from("profiles")
    .select("name, level, xp, xp_to_next, current_streak")
    .eq("id", user.id)
    .single();

  return (
    <div className="mx-auto flex min-h-dvh max-w-md flex-col pb-24">
      <header
        className="sticky top-0 z-10 bg-bg/95 px-6 pb-5 backdrop-blur"
        style={{ paddingTop: "max(1.5rem, env(safe-area-inset-top))" }}
      >
        <div className="mb-4 flex items-center justify-between">
          <p className="text-sm text-muted">
            Olá, <span className="text-text">{profile?.name || "guerreiro(a)"}</span>
          </p>
          <LogoutButton />
        </div>
        <LevelHeader
          level={profile?.level ?? 1}
          xp={profile?.xp ?? 0}
          xpToNext={profile?.xp_to_next ?? 100}
          streak={profile?.current_streak ?? 0}
        />
      </header>

      <div className="flex-1 px-6">{children}</div>

      <BottomNav />
    </div>
  );
}
