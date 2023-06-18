/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*',
    './app/views/admin/products/*'
  ],
  theme: {
    animation: {
        pulse: '2s cubic-bezier(0.4, 0, 0.6, 1) infinite',
      },
    extend: {
      keyframes: {
        pulse: {
          '0%, 100%': {
            opacity: 1,
          },
          '50%': {
            opacity: .5,
          },
        },
      },
    },
  },
  plugins: [],
}
