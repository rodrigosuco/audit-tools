import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["modal", "dropdownMenu"]

    connect() {
        this.handleDocumentClick = this.handleDocumentClick.bind(this);
        this.closeModalOnOutsideClick = this.closeModalOnOutsideClick.bind(this);
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

    toggleDropdown(event) {
        event.preventDefault();
        this.dropdownMenuTarget.classList.toggle("hidden");

        if (!this.dropdownMenuTarget.classList.contains("hidden")) {
            document.addEventListener("click", this.handleDocumentClick);
        } else {
            document.removeEventListener("click", this.handleDocumentClick);
        }
    }

    handleDocumentClick(event) {
        if (
            !this.dropdownMenuTarget.contains(event.target) &&
            !event.target.closest('[data-action="proposals#toggleDropdown"]')
        ) {
            this.dropdownMenuTarget.classList.add("hidden");
            document.removeEventListener("click", this.handleDocumentClick);
        }
    }

    closeOnEscape = (event) => {
        if (event.key === "Escape") {
            this.hideModal();
        }
    }
}
