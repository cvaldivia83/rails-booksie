// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "trix";
import "@rails/actiontext";
import "@hotwired/turbo-rails"
// import { Application } from "@hotwired/stimulus";
import "controllers"
import "@fortawesome/fontawesome-free";
import Notification from "stimulus-notification";
import PasswordVisibility from "stimulus-password-visibility";
import CharacterCounter from "stimulus-character-counter";


Stimulus.register("character-counter", CharacterCounter);

Stimulus.register("notification", Notification);

Stimulus.register("password-visibility", PasswordVisibility);
