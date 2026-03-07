import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["titleDisplay", "titleInput", "titleContainer", "form"]

  enterEdit() {
    this.titleDisplayTarget.classList.add("hidden")
    this.titleInputTarget.classList.remove("hidden")
    this.element.classList.remove("border-transparent")
    this.titleInputTarget.focus()
    this.titleInputTarget.value = this.titleDisplayTarget.textContent
    this.titleInputTarget.select()
  }

  saveEdit(event) {
    event.preventDefault()

    if (!this.hasFormTarget) return
    this.formTarget.requestSubmit()
  }

  cancelEdit(event) {
    event.preventDefault()
    this.exitEdit()
  }

  exitEdit() {
    this.titleInputTarget.classList.add("hidden")
    this.titleDisplayTarget.classList.remove("hidden")
    this.element.classList.add("border-transparent")
  }


}
