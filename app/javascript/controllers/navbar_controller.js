import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ['avatar', 'menu', 'mobileMenu']
  connect() {
    // console.log(this.element);
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

  dropdownMobile(event) {
    event.stopPropagation();
    this.mobileMenuTarget.classList.toggle("hidden");

    document.addEventListener('click', event => {
      if (event.target.closest('mobile-menu')=== null) {
        this.mobileMenuTarget.classList.add("hidden");
      }
    })
  }

}
