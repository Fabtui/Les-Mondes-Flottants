// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"
import { showMenu, artistLinkClick } from "./components/side_menu";
import { loadingCube, loadingEnterButton } from "./components/loading";
import { artistAppointmentFlatpikr, rdvButtonClick } from "./components/artist_show";

// import { Turbo } from "@hotwired/turbo-rails";
// Turbo.session.drive = false;

// show little screen side menu on bars icon click
showMenu();
artistLinkClick();
loadingCube();
loadingEnterButton();
artistAppointmentFlatpikr();
rdvButtonClick();
