import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["modal", "dateDisplay", "scheduledDateInput", "auditorSelect"]
    static values = { proposalId: Number }

    showModal(event) {
        event.preventDefault()
        const date = event.currentTarget.dataset.date
        const displayDate = new Date(date).toLocaleDateString()
        this.modalTarget.classList.remove("hidden")
        document.addEventListener("keydown", this.closeOnEscape)
        this.dateDisplayTarget.textContent = displayDate
        this.scheduledDateInputTarget.value = date
        this.fetchAuditors(date)
    }

    hideModal(event) {
        event?.preventDefault()
        this.modalTarget.classList.add("hidden")
        document.removeEventListener("keydown", this.closeOnEscape)
    }

    closeOnEscape = (event) => {
        if (event.key === "Escape") {
            this.hideModal()
        }
    }

    async fetchAuditors(date) {
        const proposalId = this.proposalIdValue
        const response = await fetch(`/proposals/${proposalId}/auditors?date=${encodeURIComponent(date)}`)
        const auditors = await response.json()
        const select = this.auditorSelectTarget

        select.innerHTML = ''

        auditors.forEach(auditor => {
            const option = document.createElement('option')
            option.value = auditor.id
            option.textContent = auditor.name
            select.appendChild(option)
        })

        select.dispatchEvent(new CustomEvent('options:updated', { bubbles: true }))
    }
}
