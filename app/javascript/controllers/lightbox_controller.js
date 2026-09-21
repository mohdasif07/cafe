import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["overlay", "image"]

  connect() {
    this.onKeydown = this.onKeydown.bind(this)
  }

  open(event) {
    const button = event.currentTarget
    const src = button.dataset.lightboxSrcParam
    const alt = button.dataset.lightboxAltParam || ""
    if (!src || !this.hasOverlayTarget || !this.hasImageTarget) return

    this.imageTarget.src = src
    this.imageTarget.alt = alt
    this.overlayTarget.hidden = false
    document.body.style.overflow = "hidden"
    document.addEventListener("keydown", this.onKeydown)
  }

  close() {
    if (!this.hasOverlayTarget || !this.hasImageTarget) return
    this.overlayTarget.hidden = true
    this.imageTarget.removeAttribute("src")
    this.imageTarget.alt = ""
    document.body.style.overflow = ""
    document.removeEventListener("keydown", this.onKeydown)
  }

  onKeydown(event) {
    if (event.key === "Escape") this.close()
  }

  disconnect() {
    document.removeEventListener("keydown", this.onKeydown)
    document.body.style.overflow = ""
  }
}
