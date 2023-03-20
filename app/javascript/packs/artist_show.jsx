// Run this example by adding <%= javascript_pack_tag 'artist_show' %> to the head of your layout file,

import React from 'react'
import ReactDOM from 'react-dom'
import { createRoot } from "react-dom/client";
import PropTypes from 'prop-types'
import Artist from './containers/artist'

Artist.propTypes = {
  id: PropTypes.string
}

document.addEventListener("DOMContentLoaded", () => {
  const container = document.querySelector(".react-artist-show");
  const id = container.dataset.artistId
  const root = createRoot(container); // createRoot(container!) if you use TypeScript
  root.render(
    <React.Fragment>
      <Artist id={id}/>
    </React.Fragment>
  );
});
