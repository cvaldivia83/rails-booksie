import { Controller } from "@hotwired/stimulus"
import Swiper, { Navigation, Pagination } from "swiper";


// Connects to data-controller="super-booksie"
export default class extends Controller {
  connect() {
    // console.log('Super Booksie is working!');
    const optionals = {
      modules: [Navigation, Pagination],
      direction: 'horizontal',
      loop: true,
      slidesPerView: 3,
      spaceBetween: 50,
      dynamicBullets: true,
      dynamicMainBullets: 5,
      centeredSlides: true,
      pagination: {
        el: '.swiper-pagination',
        type: 'bullets',
        clickable: true,
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      }
    }

    const swiper = new Swiper(this.element, optionals)
  }
}
