import { randomUUID } from "crypto";
import { NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";

const CUSTOM_MISSION_XP = 15;

export async function POST(request: Request) {
  const supabase = createClient();

  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) {
    return NextResponse.json({ error: "Não autenticado." }, { status: 401 });
  }

  const { label } = await request.json();
  const clean = typeof label === "string" ? label.trim() : "";

  if (!clean || clean.length > 40) {
    return NextResponse.json(
      { error: "Dê um nome curto para a missão (até 40 caracteres)." },
      { status: 400 }
    );
  }

  const { count } = await supabase
    .from("mission_types")
    .select("id", { count: "exact", head: true })
    .eq("user_id", user.id);

  if ((count ?? 0) >= 6) {
    return NextResponse.json(
      { error: "Você já tem o máximo de 6 missões personalizadas." },
      { status: 400 }
    );
  }

  const { data, error } = await supabase
    .from("mission_types")
    .insert({
      id: `custom-${randomUUID()}`,
      label: clean,
      icon: "custom",
      base_xp: CUSTOM_MISSION_XP,
      user_id: user.id,
    })
    .select()
    .single();

  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }

  return NextResponse.json({ mission: data });
}
