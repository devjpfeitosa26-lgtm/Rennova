"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { ListChecks, ShieldAlert } from "lucide-react";

const items = [
  { href: "/dashboard", label: "Missões", icon: ListChecks },
  { href: "/dashboard/vicios", label: "Vícios", icon: ShieldAlert },
];

export default function BottomNav() {
  const pathname = usePathname();

  return (
    <nav
      className="fixed inset-x-0 bottom-0 z-10 border-t border-line bg-bg/95 backdrop-blur"
      style={{ paddingBottom: "env(safe-area-inset-bottom, 0px)" }}
    >
      <div className="mx-auto flex max-w-md">
        {items.map(({ href, label, icon: Icon }) => {
          const active = pathname === href;
          return (
            <Link
              key={href}
              href={href}
              className="flex flex-1 flex-col items-center gap-1 py-3 text-xs"
            >
              <Icon
                size={20}
                className={active ? "text-amber" : "text-muted"}
                strokeWidth={active ? 2.4 : 2}
              />
              <span className={active ? "text-amber" : "text-muted"}>{label}</span>
            </Link>
          );
        })}
      </div>
    </nav>
  );
}
