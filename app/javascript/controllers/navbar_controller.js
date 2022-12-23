import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ['avatar', 'menu']
  connect() {
    // console.log(this.avatarTarget);
    // console.log(this.menuTarget);
  }
  dropdown(event) {
    event.stopPropagation();

    this.menuTarget.classList.toggle("hidden");

    document.addEventListener('click', event => {
      if (event.target.closest('menu') === null) {
        this.menuTarget.classList.add("hidden");
      }
    })
  }


}
