// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
// import { Application } from "@hotwired/stimulus";
import "controllers"
import "@fortawesome/fontawesome-free";
import Notification from "stimulus-notification";

Stimulus.register("notification", Notification)
