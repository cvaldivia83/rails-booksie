import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-comment"
export default class extends Controller {
  static targets = ["infos", "form", "card"]
  connect() {
    // console.log(this.cardTarget);
  }
  displayForm(event) {
    this.infosTarget.classList.add("hidden");
    this.formTarget.classList.remove("hidden");
  }

  hideForm(event) {
    this.formTarget.classList.add("hidden");
    this.infosTarget.classList.remove("hidden");
  }

  update(event) {
    event.preventDefault();

    const url = this.formTarget.action;
    const options = {
      method: "PATCH",
      headers: {'Accept': "text/plain"},
      body: new FormData(this.formTarget)
    }

    fetch(url, options)
    .then((response) => response.text())
    .then((data) => {
      this.cardTarget.outerHTML = data
    })
  }
}
