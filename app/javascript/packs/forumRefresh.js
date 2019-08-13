const refreshForum = () => {
  const yourMessage = document.querySelector("#forum_content");
  const messages = document.querySelector("ul");
  const message_start = document.querySelector("#forumstart");
  const form = document.querySelector("#new_forum");
  const url = "http://localhost:3000/forums";
  const refresh = document.getElementById("refresh");

  // POST
  form.addEventListener("submit", (event) => {
    // const match = event.target.baseURI.split("/")[4]
    // const match_id = Number.parseInt(match, 10);
    event.preventDefault();
    const url = event.target.baseURI + '/forums'
    const message = yourMessage.value;

    const myMessage = { content: message };
    fetch(url, {
      method: 'POST',
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(myMessage)
    }).then(res => res.json())
      .then((response) => {
        message_start.insertAdjacentHTML("afterbegin", `
          <div class="m-3">
              <h5 class="m-0"><strong>
                ${response.name} - Just Now
              </strong>
              </h5>
              <p class="m-0"> ${message} </p>
            </div>
          `);
        console.log('Success:', JSON.stringify(response))
      });
  });
}

export { refreshForum }


// GET
// document.addEventListener("DOMContentLoaded", (event) => {
//   const match = event.target.baseURI.split("/")[4]
//   const match_id = Number.parseInt(match, 10);
//   console.log(match_id)

//   fetch(url)
//   .then(response => response.json())
//   .then((data) => {
//     messages.innerHTML = "";
//     data.forEach((element) => {
//       if (element.match_id === match_id) {
//       messages.insertAdjacentHTML("afterbegin", `<li>${element.content}</li>`);
//       console.log(element)
//       }
//     });
//   });
// })
