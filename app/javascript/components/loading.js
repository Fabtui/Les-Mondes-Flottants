// import { format } from "path";
import * as THREE from "three";
// import { MeshNormalMaterial } from "three";

export const loading = () => {
  const threeContainer = document.querySelector("#threejs");

  if (threeContainer) {

    let scene, camera, renderer, line;

    const init = () => {
      scene = new THREE.Scene();
      camera = new THREE.PerspectiveCamera(
        75,
        window.innerWidth / window.innerHeight,
        0.1,
        1000
      );
      renderer = new THREE.WebGL1Renderer({ antialias: true });
      renderer.setSize(window.innerWidth, window.innerHeight);
      renderer.setClearColor(0xffffff, 0);

      const threeDiv = document.querySelector("#threejs");
      threeDiv.appendChild(renderer.domElement);

      // const geometry = new THREE.BoxGeometry( 30, 30, 30 );
      // const texture = new THREE.TextureLoader().load(crate)
      // const material = new THREE.MeshBasicMaterial( {map: texture} );
      // cube = new THREE.Mesh( geometry, material );
      // scene.add( cube );

      const geometry2 = new THREE.BoxGeometry(10, 10, 10);
      const edges = new THREE.EdgesGeometry(geometry2);
      line = new THREE.LineSegments(
        edges,
        new THREE.LineBasicMaterial({ color: 0xE9E9E9 })
      );
      scene.add(line);

      camera.position.z = 25;  // zoom
      camera.position.y = 0;  // height
    };

    const animate = () => {
      requestAnimationFrame(animate);
      line.rotation.x += 0.001;
      renderer.render(scene, camera);
    };

    const onWindowResize = () => {
      camera.aspect = window.innerWidth / window.innerHeight;
      camera.updateProjectionMatrix();
      renderer.setSize(window.innerWidth, window.innerHeight);
    };

    window.addEventListener("resize", onWindowResize, false);
    init();
    animate();
  };
};

export const loadingEnterButton = () => {
  const loadingContainer = document.querySelector(".loading-container");

  if (loadingContainer) {
    const loadingButton = document.querySelector("#loading-button");

    const redirectHome = () => {
      window.location = ('/home')
    }

    const enterLoading = () => {
      loadingContainer.classList.add('zoom-in')
      setTimeout(redirectHome, 1000);
    }

    loadingButton.addEventListener('click', enterLoading)
  }
}
