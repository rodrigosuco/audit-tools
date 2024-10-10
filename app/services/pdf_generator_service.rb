# app/services/pdf_generator_service.rb

class PdfGeneratorService
  def initialize(proposal)
    @proposal = proposal
  end

  def generate_pdf
    ApplicationController.render(
      pdf: "proposal",
      template: "proposals/proposal",
      layout: "pdf",
      encoding: "UTF-8",
      assigns: { proposal: @proposal }
    )
  end
end
