import { Controller } from "@hotwired/stimulus"
import SlimSelect from 'slim-select'

export default class extends Controller {
  connect() {
    this.initializeSlimSelect()
    this.element.addEventListener('options:updated', this.optionsUpdated)
  }

  disconnect() {
    this.slimSelect.destroy()
    this.element.removeEventListener('options:updated', this.optionsUpdated)
  }

  initializeSlimSelect() {
    this.slimSelect = new SlimSelect({
      select: this.element
    })
  }

  optionsUpdated = () => {
    this.slimSelect.setData(
        Array.from(this.element.options).map(option => ({
          text: option.textContent,
          value: option.value
        }))
    )
  }
}
