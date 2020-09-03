import { Controller } from "stimulus";
export default class extends Controller {
  static targets = [ 'chatroom', 'messages' ];
  toto() {
    const id = event.currentTarget.dataset.id;
    document.querySelector(".chatroom-selected").innerHTML = id
    document.querySelectorAll(".chatroom").forEach((chatroom) => {
      chatroom.classList.remove("clicked")
    })
    document.querySelectorAll(".messages").forEach((chat) => {
      chat.classList.add("d-none")
    })
    document.querySelectorAll(".form-chatroom").forEach((form) =>{
      form.classList.add("d-none")
    })
    document.querySelectorAll(".message-container").forEach((message) => {
      const authorId = message.querySelector(".authorid").innerHTML
      const photoUser = message.querySelector(".photo-user")
      const photoOther = message.querySelector(".photo-other")
      const mediaUser = message.querySelector(".media-user")
      const mediaOther = message.querySelector(".media-other")
      const userId = document.querySelector(".user-id").innerHTML
      if(authorId === userId){
        message.classList.add("message-from-user")
        photoUser.classList.remove("d-none")
        mediaUser.classList.remove("d-none")
      }
      else{
        message.classList.add("message-not-user")
        photoOther.classList.remove("d-none")
        mediaOther.classList.remove("d-none")
      }
    })

    document.querySelector(`#messages-${id}`).classList.remove("d-none")
    document.querySelector(`.form-${id}`).classList.remove("d-none")
    event.currentTarget.classList.add("clicked")
    event.preventDefault();
    const chatroomId = document.querySelector("#message_chatroom_id")
    const messages = document.querySelector(".messages")
    const messagesSelected = document.querySelector(`#messages-${id}`)
    messagesSelected.scrollTop =  messagesSelected.scrollHeight
  }
}
