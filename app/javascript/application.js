import "@hotwired/turbo-rails"
import "controllers"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import { Carousel } from 'bootstrap'

// ここでCarouselを初期化する場合
document.addEventListener('DOMContentLoaded', function () {
  var myCarousel = document.querySelector('#carouselExampleFade');
  if (myCarousel) {
    var carousel = new Carousel(myCarousel, {
      interval: 5000, // スライドの切り替え間隔（ミリ秒）
      ride: 'carousel', // 自動でスライドを開始
      pause: 'hover', // マウスホバー時にスライドを停止
      wrap: true, // 最後のスライドの後に最初のスライドに戻る
      keyboard: true // キーボード操作を有効にする
    });
  }
});

ActiveStorage.start()

// Function to initialize Google Maps
function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 10,
    center: { lat: 32.9736, lng: 131.5856 } // Replace with your coordinates
  });

  // Load GeoJSON data for map (if applicable)
  map.data.loadGeoJson('/city.json');

  // Set map style (optional)
  map.data.setStyle({
    strokeColor: '#FF0000',
    strokeWeight: 2
  });
}

// Load Google Maps API script dynamically
document.addEventListener("DOMContentLoaded", function() {
  const script = document.createElement('script');
  script.src = "https://maps.googleapis.com/maps/api/js?key=AIzaSyCA-vRsupZ3bq3ts8IibdEPp2TnJSCm094&callback=initMap";
  script.async = true;
  script.defer = true;
  document.head.appendChild(script);
});
