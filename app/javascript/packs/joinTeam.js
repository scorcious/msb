const joimTeam = () =>  {

  const joinA = document.getElementById('joinA')
  const joinB = document.getElementById('joinB')

  joinB.addEventListener("click", (event) => {
    const match = event.target.baseURI.split("/")[4]
    const match_id = Number.parseInt(match, 10);
    event.preventDefault();
    // const url = event.target.baseURI + '/join_team'

    const url = `http://localhost:3000/players/join_team`
    // http://localhost:3000/matches/24/players?player%5Bteam%5D=A

    const myMessage = { content: 'felipeeee' };

    fetch(url, {
      method: 'POST',
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(myMessage)
    }).then(res => res.json())
      .then((response) => {
        console.log(response)
        // if (response.forum_empty == "true") {
          // message_start.parentElement.innerHTML = `<div id='forumstart'></div>`;
        // }
        // message_start = document.querySelector("#forumstart");
        // message_start.insertAdjacentHTML("afterend", `
          // <div class="m-3">
              // <h5 class="m-0"><strong>
                // ${response.name} - ${response.timestamp} Local
              // </strong>
              // </h5>
              // <p class="m-0"> ${message} </p>
            // </div>
          // `);
        // console.log('Success:', JSON.stringify(response))
      });

  });
}

export { joimTeam }


// const refreshForum = () => {
//   const yourMessage = document.querySelector("#forum_content");
//   const messages = document.querySelector("ul");
//   let message_start = document.querySelector("#forumstart");
//   console.log(message_start)
//   const form = document.querySelector("#new_forum");
//   const url = "http://localhost:3000/forums";
//   const refresh = document.getElementById("refresh");

//   // POST
//   form.addEventListener("submit", (event) => {
//     // const match = event.target.baseURI.split("/")[4]
//     // const match_id = Number.parseInt(match, 10);
//     event.preventDefault();
//     const url = event.target.baseURI + '/forums'
//     let message = yourMessage.value;

//     const myMessage = { content: message };
//     fetch(url, {
//       method: 'POST',
//       headers: { "Content-Type": "application/json" },
//       body: JSON.stringify(myMessage)
//     }).then(res => res.json())
//       .then((response) => {
//         if (response.forum_empty == "true") {
//           message_start.parentElement.innerHTML = `<div id='forumstart'></div>`;
//         }
//         message_start = document.querySelector("#forumstart");
//         message_start.insertAdjacentHTML("afterend", `
//           <div class="m-3">
//               <h5 class="m-0"><strong>
//                 ${response.name} - ${response.timestamp} Local
//               </strong>
//               </h5>
//               <p class="m-0"> ${message} </p>
//             </div>
//           `);
//         console.log('Success:', JSON.stringify(response))
//       });

//     console.log(yourMessage);
//     yourMessage.value = ""
//   });
// }

// const refreshButton = () => {
//     document.querySelector("#refresh").disabled = false;
//   }

// export { refreshForum, refreshButton }
