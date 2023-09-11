// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
// import { Application } from "@hotwired/stimulus";
import "controllers"
import "@fortawesome/fontawesome-free";
import Notification from "stimulus-notification";
import PasswordVisibility from "stimulus-password-visibility";

Stimulus.register("notification", Notification);

Stimulus.register("password-visibility", PasswordVisibility);
import "trix"
import "@rails/actiontext"
