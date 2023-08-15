import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Object
  }

  connect() {

    console.log(this.markersValue);
    mapboxgl.accessToken = this.apiKeyValue;

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/light-v11",
    });

    this.#addMarkersToMap();
    this.#fitMapToMarkers();
  }

  #addMarkersToMap() {
    new mapboxgl.Marker()
    .setLngLat([ this.markersValue.long, this.markersValue.lat ])
    .addTo(this.map)
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()

    bounds.extend([ this.markersValue.long, this.markersValue.lat ])

    this.map.fitBounds(bounds, {
      padding: 70, maxZoom: 15, duration: 0
    })
  }
}
