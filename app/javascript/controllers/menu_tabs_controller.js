import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["tab", "panel"]

  select(event) {
    const category = event.params.category
    this.tabTargets.forEach((tab) => {
      const active = tab.dataset.menuTabsCategoryParam === category
      tab.classList.toggle("is-active", active)
      tab.setAttribute("aria-selected", active ? "true" : "false")
    })
    this.panelTargets.forEach((panel) => {
      const match = panel.dataset.category === category
      panel.hidden = !match
    })
  }
}
