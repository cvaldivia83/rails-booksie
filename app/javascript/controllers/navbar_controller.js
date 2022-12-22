import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ['avatar', 'menu']
  connect() {
    // console.log(this.avatarTarget);
    // console.log(this.menuTarget);
  }
  dropdown() {
    this.menuTarget.classList.toggle("hidden");
  }
  close() {
    this.menuTarget.classList.toggle("hidden")
  }
}
