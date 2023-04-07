import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-books"
export default class extends Controller {
  static targets = ["form", "input", "list"]
  connect() {
    console.log(this.listTarget);
  }

  update(event) {
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`;
    const options = {headers: {'Accept': "text/plain"}}

    fetch(url, options)
    .then((response) => response.text())
    .then((data) => {
      this.listTarget.outerHTML = data;
    })
  }
}
