import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="social"
export default class extends Controller {
  static targets = [ "commentBtn", "commentForm" ]
  connect() {
    // console.log(this.commentFormTarget);
  }

  openComment(event) {
    this.commentFormTarget.classList.toggle("hidden");
  }
}
