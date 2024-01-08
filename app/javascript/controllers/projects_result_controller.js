import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="projects-result"
var img = [];
var x = [];
var y = [];

export default class extends Controller {
  connect() {
    for (let i = 0; i < 6; i++) {
      img[i] = sessionStorage.getItem("i"+i);
      x[i]   = sessionStorage.getItem("x"+i);
      y[i]   = sessionStorage.getItem("y"+i);
    }
    var x_label = sessionStorage.getItem("x_label");
    var y_label = sessionStorage.getItem("y_label");

    var urls = JSON.parse(sessionStorage.getItem("URLs"));
    urls.forEach( (item, i) => {
      $("#poster"+i).attr('src', item);
    });

    // Chart options
    Chart.defaults.font.size = 18;
    Chart.defaults.elements.point.radius = 10;
    Chart.defaults.elements.point.hoverRadius = 20;

    var opts = { 
      aspectRatio: 1,
      scales: { 
        x: { min: -1.0, max: 1.0, 
             title: { color: 'navy', display: true, text: x_label },
           },
        y: { min: -1.0, max: 1.0,
             title: { color: 'navy', display: true, text: y_label },
           }
        },
      plugins: { legend: { display: false, position: 'chartArea' } }
    };
    var styles = ['circle', 'rect', 'triangle', 'rectRounded', 'rectRot', 'triangle' ];
    var rotate = [ 0, 0, 0, 0, 0, 180 ];

    $.ajax({
        url: "average",
        type: "POST", dataType: "json", data: { img }
      }).done(function(data) {
        var scatter_data = [];
        // your data
        for (let i = 0; i < 6; i++) {
          scatter_data.push({
            data: [{ x: x[i], y: y[i] }],
            backgroundColor: 'rgba(0, 159, 255, 0.45)',
            borderColor: 'rgba(0, 159, 255, 0.5)',
            pointStyle: styles[i],
            rotation: rotate[i]
          });
        }
        // everybody's data
        data.forEach((item, i) => {
          console.log(item);
          scatter_data.push({
            data: [{ x: item["x"], y: item["y"] }],
            backgroundColor: 'rgba(255, 48, 32, 0.45)',
            borderColor: 'rgba(255, 48, 32, 0.5)',
            pointStyle: styles[i],
            rotation: rotate[i]
          });
        });

        new Chart($("#scatterPlot"), {
          type: 'scatter', data: { datasets: scatter_data }, options: opts
        });
      });
  }
}
