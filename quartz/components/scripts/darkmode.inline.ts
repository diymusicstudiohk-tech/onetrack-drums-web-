// Quartz 4 Darkmode Script
// Forced Light Mode Version

const userPref = window.matchMedia("(prefers-color-scheme: light)").matches ? "light" : "dark"
// Force "light" regardless of user preference or system setting
const currentTheme = "light"
document.documentElement.setAttribute("saved-theme", currentTheme)

const emitThemeChangeEvent = (theme: "light" | "dark") => {
  const event: CustomEvent = new CustomEvent("themechange", {
    detail: {
      theme,
    },
  })
  document.dispatchEvent(event)
}

document.addEventListener("nav", () => {
  const switchTheme = () => {
    // Logic kept but essentially disabled since we want to force light
  }

  const themeChange = () => {}

  const darkmodeBtn = document.getElementsByClassName("darkmode")
  for (const btn of darkmodeBtn) {
    btn.addEventListener("click", switchTheme)
    window.addCleanup(() => btn.removeEventListener("click", switchTheme))
  }

  const colorSchemeMediaQuery = window.matchMedia("(prefers-color-scheme: dark)")
  colorSchemeMediaQuery.addEventListener("change", themeChange)
  window.addCleanup(() => colorSchemeMediaQuery.removeEventListener("change", themeChange))
})
