import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="read-more"
export default class extends Controller {
  static targets = ["arrowDown", "form", "arrowUp"]
  connect() {
    // console.log(this.arrowTarget, this.formTarget);
  }

  openForm() {
    this.arrowDownTarget.classList.add("hidden");
    this.formTarget.classList.add("animated", "slideInDown");
    this.formTarget.classList.remove("hidden");

    window.scrollBy(0, 280);

  }

  closeForm() {
    this.formTarget.classList.add("animated", "slideOutUp");
    this.formTarget.classList.add("hidden");
    this.arrowDownTarget.classList.remove("hidden");
    window.scrollBy(0, -10);
  }
}
