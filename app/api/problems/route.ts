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

  const { name } = await request.json();
  const clean = typeof name === "string" ? name.trim() : "";

  if (!clean || clean.length > 60) {
    return NextResponse.json({ error: "Dê um nome válido para o desafio." }, { status: 400 });
  }

  const { data, error } = await supabase
    .from("problems")
    .insert({ user_id: user.id, name: clean })
    .select()
    .single();

  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }

  return NextResponse.json({ problem: data });
}
