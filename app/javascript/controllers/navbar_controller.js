import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ['avatar', 'menu', 'mobileMenu']
  connect() {
    //console.log("I am working!");
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

  updateNavbar() {
    if (window.scrollY >= window.innerHeight) {
      this.element.classList.add("shadow-md", "bg-white");
    } else {
      this.element.classList.remove("shadow-md",  "bg-white");
    }
  }


}
