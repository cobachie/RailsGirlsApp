import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    this.appendLine(data)
  },

  appendLine(data) {
    const html = data
    const element = document.getElementById("comment-list")
    element.insertAdjacentHTML("beforeend", html)
  }
});
