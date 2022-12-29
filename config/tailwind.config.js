const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    "./public/*.html",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*.{erb,haml,html,slim}",
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ["Inter var", ...defaultTheme.fontFamily.sans],
        pacifico: ["Pacifico", "sans-serif"],
      },
      colors: {
        mint: {
          100: "#c9fff0",
          400: "#B6E5D8",
          500: "#91b8ad",
          600: "#75948b",
          700: "#536962",
          800: "#32403c",
          900: "#1e2624",
        },
        rose: "#FFC2C7",
        peach: "#FBE5C8",
        turquoise: "#8FDDE7",
      },
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/aspect-ratio"),
    require("@tailwindcss/typography"),
  ],
};
