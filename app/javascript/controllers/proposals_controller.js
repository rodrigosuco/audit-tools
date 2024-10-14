import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["modal", "dropdownMenu", "downloadButton"]

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

    timeOutButton(event) {
        const link = event.currentTarget;

        if (link.classList.contains('disabled')) {
            event.preventDefault();
            return;
        }
        link.innerHTML="Download has started"
        link.classList.add('disabled');
        link.style.pointerEvents = 'none';
        link.style.opacity = '0.5';
        setTimeout(() => {
            link.innerHTML="Download"
            link.classList.remove('disabled');
            link.style.pointerEvents = '';
            link.style.opacity = '';
        }, 60000);
    }
}
