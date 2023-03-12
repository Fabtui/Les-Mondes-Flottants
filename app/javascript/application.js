// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"
import { showMenu } from "./components/side_menu_show";

import { Turbo } from "@hotwired/turbo-rails";
Turbo.session.drive = false;

// show little screen side menu on bars icon click
showMenu()
