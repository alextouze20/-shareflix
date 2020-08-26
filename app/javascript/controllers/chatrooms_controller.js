import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'chatroom', 'messages' ];

    event.preventDefault();
    const id = event.currentTarget.dataset.id;
    const messages = document.querySelector(".messages")
    fetch(` http://localhost:3000/api/v1/chatrooms/${id}`)
      .then(response => response.json())
      .then((data) => {
        console.log(data.messages);
        console.log(messages)
        messages.innerHTML = ""
        data.messages.forEach (message => {
            messages.insertAdjacentHTML(
              "afterbegin",
              `<div class="message">
              <p>${message}</p>
              </div>`
            );
        });
      });
  }
}
