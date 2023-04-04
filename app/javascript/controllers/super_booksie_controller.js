import { Controller } from "@hotwired/stimulus"
import Swiper, { Navigation, Pagination } from "swiper";


// Connects to data-controller="super-booksie"
export default class extends Controller {
  connect() {
    var optionals = {
      modules: [Navigation, Pagination],
      direction: "horizontal",
      loop: true,
      slidesPerView: "auto",
      loopFillGroupBlank: false,
      spaceBetween: 10,
      centeredSlides: true,
      pagination: {
        el: ".swiper-pagination",
        type: "bullets",
        clickable: true,
      },
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
    };

    var swiper = new Swiper(this.element, optionals)
  }
}
