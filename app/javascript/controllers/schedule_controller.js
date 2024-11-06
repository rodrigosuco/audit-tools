import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["modal"]

    connect() {
        this.handleDocumentClick = this.handleDocumentClick.bind(this);
    }

    showModal(event) {
        event.preventDefault();
        this.modalTarget.classList.remove("hidden");
        document.addEventListener("keydown", this.closeOnEscape);
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
