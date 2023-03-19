// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"
import { showMenu, artistLinkClick } from "./components/side_menu";
import { loading, loadingEnterButton } from "./components/loading";

import { Turbo } from "@hotwired/turbo-rails";
Turbo.session.drive = false;

// show little screen side menu on bars icon click
showMenu();
artistLinkClick();
loading();
loadingEnterButton();
