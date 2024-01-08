import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="projects-eval"
export default class extends Controller {
  connect() {
    $(function() {
      for (let i = 0; i < 6; i++) {
        sessionStorage.setItem("x"+i, 0.0);
        $("#slider-x"+i).slider({ min:-1.0, max:1.0, step:0.01, value:0.0,
            slide: function(event, ui) {
                     $("#val-x"+i).attr("value", ui.value);
                     sessionStorage.setItem("x"+i, ui.value);
                   } });
        sessionStorage.setItem("y"+i, 0.0);
        $("#slider-y"+i).slider({ min:-1.0, max:1.0, step:0.01, value:0.0,
            slide: function(event, ui) {
                     $("#val-y"+i).attr("value", ui.value);
                     sessionStorage.setItem("y"+i, ui.value);
                   } });
      }
    });
  }
}
