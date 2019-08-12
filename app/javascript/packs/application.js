import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';

import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

initMapbox();


const yourMessage = document.querySelector("#forum_content");
const messages = document.querySelector("ul");
const form = document.querySelector("#new_forum");
const url = "http://localhost:3000/forums";
const refresh = document.getElementById("refresh");

// GET
document.addEventListener("DOMContentLoaded", (event) => {
  const match = event.target.baseURI.split("/")[4]
  const match_id = Number.parseInt(match, 10);
  console.log(match_id)

  fetch(url)
  .then(response => response.json())
  .then((data) => {
    messages.innerHTML = "";
    data.forEach((element) => {
      if (element.match_id === match_id) {
      messages.insertAdjacentHTML("afterbegin", `<li>${element.content}</li>`);
      console.log(element)
      }
    });
  });
})

// const refreshChat = () => {
// }


// FETCH




// POST
// form.addEventListener("submit", (event) => {
//   const match = event.target.baseURI.split("/")[4]
//   const match_id = Number.parseInt(match, 10);
//   const url = event.target.baseURI + '/forums'
//   const message = yourMessage.value;
//   event.preventDefault();
//   const myMessage = { content: `${message}` };
// });

// const postMessage = (message, callback, url) => {
//   fetch(url, {
//     method: 'POST',
//     headers: { "Content-Type": "application/json" },
//     body: JSON.stringify(message)
//   })
//     callback();
// }

// POST
form.addEventListener("submit", (event) => {
  // const match = event.target.baseURI.split("/")[4]
  // const match_id = Number.parseInt(match, 10);
  event.preventDefault();
  const url = event.target.baseURI + '/forums'
  const message = yourMessage.value;
  console.log(message)
  messages.insertAdjacentHTML("afterbegin", `<li><%= raise; %>${message}</li>`);

  const myMessage = { content: message };
  fetch(url, {
    method: 'POST',
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(myMessage)
  });
});

// refresh.addEventListener("click", refreshChat);

// document.addEventListener("DOMContentLoaded", refreshChat);








