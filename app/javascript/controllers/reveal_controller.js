import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    if (window.matchMedia("(prefers-reduced-motion: reduce)").matches) {
      this.element.querySelectorAll("[data-reveal]").forEach((el) => el.classList.add("is-visible"))
      return
    }

    this.observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            entry.target.classList.add("is-visible")
            this.observer.unobserve(entry.target)
          }
        })
      },
      { threshold: 0.12, rootMargin: "0px 0px -40px 0px" }
    )

    this.element.querySelectorAll("[data-reveal]").forEach((el) => this.observer.observe(el))
  }

  disconnect() {
    this.observer?.disconnect()
  }
}
