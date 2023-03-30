import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js";

// Connects to data-controller="hero"
export default class extends Controller {
  static targets = ["motto", "image"]
  connect() {
    var options = {
      strings: ["reading more, ^1000 reading better"],
      typeSpeed: 80,
      loop: true
    };
    var typed = new Typed(this.mottoTarget, options);

    setTimeout(() => {
      this.imageTarget.classList.add("animated", "bounce");
    }, "1500");
  }
}
