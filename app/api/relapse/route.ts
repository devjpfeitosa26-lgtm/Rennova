import { NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";

export async function POST(request: Request) {
  const supabase = createClient();

  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) {
    return NextResponse.json({ error: "Não autenticado." }, { status: 401 });
  }

  const { problemId, note } = await request.json();

  const { data: profile, error: profileError } = await supabase
    .from("profiles")
    .select("xp, level, current_streak")
    .eq("id", user.id)
    .single();

  if (profileError || !profile) {
    return NextResponse.json({ error: "Perfil não encontrado." }, { status: 500 });
  }

  const { error: relapseError } = await supabase.from("relapses").insert({
    user_id: user.id,
    problem_id: problemId ?? null,
    note: note ?? null,
    xp_before: profile.xp,
    level_before: profile.level,
    streak_before: profile.current_streak,
  });

  if (relapseError) {
    return NextResponse.json({ error: relapseError.message }, { status: 500 });
  }

  const { data: updated, error: updateError } = await supabase
    .from("profiles")
    .update({
      xp: 0,
      level: 1,
      xp_to_next: 100,
      current_streak: 0,
      last_activity_date: null,
    })
    .eq("id", user.id)
    .select()
    .single();

  if (updateError) {
    return NextResponse.json({ error: updateError.message }, { status: 500 });
  }

  return NextResponse.json({ profile: updated });
}
