import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="alert"
export default class extends Controller {
  static targets = ['alert', 'notice']
  connect() {
    setTimeout(() => {
      this.alertTarget.style.display = "none";
    }, 600);

    setTimeout(() => {
      this.noticeTarget.style.display = "none";
    }, 600);
  }

  closeAlert(event) {
    console.log(event.currentTarget);
    event.currentTarget.style.opacity = '0';
  }
}
