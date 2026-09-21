import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["header", "toggle", "mobile"]

  connect() {
    this.onScroll = this.onScroll.bind(this)
    this.onScroll()
    window.addEventListener("scroll", this.onScroll, { passive: true })
    document.addEventListener("keydown", this.onKeydown)
    this.element.addEventListener("click", this.onNavClick)
  }

  disconnect() {
    window.removeEventListener("scroll", this.onScroll)
    document.removeEventListener("keydown", this.onKeydown)
    this.element.removeEventListener("click", this.onNavClick)
  }

  onNavClick = (event) => {
    if (event.target.closest("a")) this.close()
  }

  onScroll() {
    if (!this.hasHeaderTarget) return
    this.headerTarget.classList.toggle("is-scrolled", window.scrollY > 24)
  }

  toggle() {
    if (!this.hasMobileTarget || !this.hasToggleTarget) return
    const open = this.mobileTarget.hasAttribute("hidden")
    if (open) {
      this.mobileTarget.removeAttribute("hidden")
      this.toggleTarget.classList.add("is-open")
      this.toggleTarget.setAttribute("aria-expanded", "true")
      this.toggleTarget.setAttribute("aria-label", "Close menu")
    } else {
      this.close()
    }
  }

  close() {
    if (!this.hasMobileTarget || !this.hasToggleTarget) return
    this.mobileTarget.setAttribute("hidden", "")
    this.toggleTarget.classList.remove("is-open")
    this.toggleTarget.setAttribute("aria-expanded", "false")
    this.toggleTarget.setAttribute("aria-label", "Open menu")
  }

  onKeydown = (event) => {
    if (event.key === "Escape") this.close()
  }
}
