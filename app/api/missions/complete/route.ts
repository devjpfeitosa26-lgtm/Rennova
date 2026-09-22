import { NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";
import { applyXp, updateStreak, todayISO } from "@/lib/gamification";

export async function POST(request: Request) {
  const supabase = createClient();

  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) {
    return NextResponse.json({ error: "Não autenticado." }, { status: 401 });
  }

  const { missionId } = await request.json();
  if (!missionId || typeof missionId !== "string") {
    return NextResponse.json({ error: "Missão inválida." }, { status: 400 });
  }

  const today = todayISO();

  const { data: mission } = await supabase
    .from("mission_types")
    .select("id, base_xp, label")
    .eq("id", missionId)
    .maybeSingle();

  if (!mission) {
    return NextResponse.json({ error: "Missão não encontrada." }, { status: 404 });
  }

  // Já existe alguma missão concluída hoje? (decide se o streak avança)
  const { count: completedToday } = await supabase
    .from("daily_completions")
    .select("id", { count: "exact", head: true })
    .eq("user_id", user.id)
    .eq("completion_date", today);

  const { error: insertError } = await supabase.from("daily_completions").insert({
    user_id: user.id,
    mission_id: mission.id,
    completion_date: today,
    xp_earned: mission.base_xp,
  });

  if (insertError) {
    if (insertError.code === "23505") {
      return NextResponse.json(
        { error: "Você já concluiu essa missão hoje." },
        { status: 409 }
      );
    }
    return NextResponse.json({ error: insertError.message }, { status: 500 });
  }

  const { data: profile, error: profileError } = await supabase
    .from("profiles")
    .select("*")
    .eq("id", user.id)
    .single();

  if (profileError || !profile) {
    return NextResponse.json({ error: "Perfil não encontrado." }, { status: 500 });
  }

  const xpResult = applyXp(profile, mission.base_xp);
  const streakResult = (completedToday ?? 0) === 0 ? updateStreak(profile, today) : null;

  const { data: updated, error: updateError } = await supabase
    .from("profiles")
    .update({
      xp: xpResult.xp,
      level: xpResult.level,
      xp_to_next: xpResult.xp_to_next,
      ...(streakResult ?? {}),
    })
    .eq("id", user.id)
    .select()
    .single();

  if (updateError) {
    return NextResponse.json({ error: updateError.message }, { status: 500 });
  }

  return NextResponse.json({
    profile: updated,
    xpEarned: mission.base_xp,
    leveledUp: xpResult.leveledUp,
  });
}
