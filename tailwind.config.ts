import type { Config } from "tailwindcss";

const config: Config = {
  content: [
    "./app/**/*.{js,ts,jsx,tsx,mdx}",
    "./components/**/*.{js,ts,jsx,tsx,mdx}",
  ],
  theme: {
    extend: {
      colors: {
        bg: "#0F1A14",
        surface: "#16241C",
        surface2: "#1D2E24",
        line: "#2A3D31",
        text: "#F1EDE4",
        muted: "#A9B8AC",
        amber: {
          DEFAULT: "#E8A33D",
          soft: "#F0C079",
        },
        moss: {
          DEFAULT: "#4F9D69",
          soft: "#7CBE8F",
        },
        rust: "#C1502E",
      },
      fontFamily: {
        display: ["var(--font-display)", "serif"],
        body: ["var(--font-body)", "sans-serif"],
      },
      borderRadius: {
        sm: "4px",
        md: "8px",
        lg: "14px",
      },
      keyframes: {
        "xp-fill": {
          "0%": { width: "var(--from)" },
          "100%": { width: "var(--to)" },
        },
        "pop-in": {
          "0%": { opacity: "0", transform: "scale(0.9) translateY(6px)" },
          "100%": { opacity: "1", transform: "scale(1) translateY(0)" },
        },
      },
      animation: {
        "xp-fill": "xp-fill 900ms cubic-bezier(.22,1,.36,1) forwards",
        "pop-in": "pop-in 400ms cubic-bezier(.22,1,.36,1) forwards",
      },
    },
  },
  plugins: [],
};
export default config;
