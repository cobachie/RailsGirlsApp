import { Controller } from "stimulus"

export default class extends Controller {
  like() {
    let element = event.currentTarget;
    let idea_id = element.dataset.id;
    let url = `/ideas/${idea_id}/like`;

    fetch(url, {
        method: 'PATCH',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
        }
      })
      .then(response => response.json())
      .then(json => {
        let likesCount = document.getElementById(`idea-${idea_id}-likes`)
        likesCount.textContent = json['likes_count']
      })
      .catch(error => {
        console.error(error);
      });
  }
}
