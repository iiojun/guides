import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="projects-eval"
export default class extends Controller {
  connect() {
    $(function() {
      for (let i = 0; i < 6; i++) {
        sessionStorage.setItem("x"+i, 0.0);
        new rSlider({
               target: "#slider-x"+i, range: false,
               values: {min: -1.0, max: 1.0}, step:0.01, set: [0.0],
               labels: false, tooltip: false, scale: null,
               onChange: function(val) {
                      $("#val-x"+i).attr("value", val);
                      sessionStorage.setItem("x"+i, val);
                    } });
        sessionStorage.setItem("y"+i, 0.0);
        new rSlider({
               target: "#slider-y"+i, range: false,
               values: {min: -1.0, max: 1.0}, step:0.01, set: [0.0],
               labels: false, tooltip: false, scale: null,
               onChange: function(val) {
                      $("#val-y"+i).attr("value", val);
                      sessionStorage.setItem("y"+i, val);
                    } });
      }

      $("#submit").on('click', function() {
          urls = [];
          for (let i = 0; i < 6; i++) {
            urls.push($("#image-"+i).attr("src"));
            sessionStorage.setItem("i"+i, $("#img-"+i).attr("value"));
          } 
          sessionStorage.setItem("URLs", JSON.stringify(urls));
          sessionStorage.setItem("x_label", $("#x_axis-0").text());
          sessionStorage.setItem("y_label", $("#y_axis-0").text());
      });
    });
  }
}
