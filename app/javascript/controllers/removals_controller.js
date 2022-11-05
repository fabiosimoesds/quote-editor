import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="removals"
export default class extends Controller {
  connect(){
    console.log('connected')
  }
  remove() {
    console.log('working')
    this.element.remove()
  }
}
