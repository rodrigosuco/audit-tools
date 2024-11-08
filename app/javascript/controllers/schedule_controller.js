import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["modal", "dateDisplay", "scheduledDateInput"]

    showModal(event) {
        event.preventDefault();
        const date = event.currentTarget.dataset.date;
        this.modalTarget.classList.remove("hidden");
        document.addEventListener("keydown", this.closeOnEscape);
        this.dateDisplayTarget.textContent = date;
        this.scheduledDateInputTarget.value = date;
    }

    hideModal(event) {
        event?.preventDefault();
        this.modalTarget.classList.add("hidden");
        document.removeEventListener("keydown", this.closeOnEscape);
    }

    closeOnEscape = (event) => {
        if (event.key === "Escape") {
            this.hideModal();
        }
    }
}
