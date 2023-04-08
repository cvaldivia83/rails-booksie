import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-comment"
export default class extends Controller {
  static targets = ["form", "items"]
  connect() {
    // console.log(this.element, this.formTarget, this.itemsTarget);
  }
}
