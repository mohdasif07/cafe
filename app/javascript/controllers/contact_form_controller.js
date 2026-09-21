import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["name", "email", "message", "error"]

  validate(event) {
    const name = this.nameTarget.value.trim()
    const email = this.emailTarget.value.trim()
    const message = this.messageTarget.value.trim()
    const errors = []

    if (!name) errors.push("Name is required.")
    if (!email) errors.push("Email is required.")
    else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) errors.push("Please enter a valid email.")
    if (!message) errors.push("Message is required.")

    if (errors.length) {
      event.preventDefault()
      this.errorTarget.hidden = false
      this.errorTarget.textContent = errors.join(" ")
    } else {
      this.errorTarget.hidden = true
      this.errorTarget.textContent = ""
    }
  }
}
