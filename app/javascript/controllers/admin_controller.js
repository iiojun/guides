import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="admin"
export default class extends Controller {
  connect() {
    $(".confirm-delete").on('click', function() {
      if (!confirm("Do you really delete it?")) {
        return false;
      }
    });
  }
}
