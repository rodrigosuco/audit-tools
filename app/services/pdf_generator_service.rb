# app/services/pdf_generator_service.rb

class PdfGeneratorService
  def initialize(proposal, current_user)
    @proposal = proposal
    @current_user = current_user
  end

  def generate_pdf
    ApplicationController.render(
      pdf: "proposal",
      template: "proposals/proposal",
      layout: "pdf",
      encoding: "UTF-8",
      assigns: { proposal: @proposal, current_user: @current_user }
    )
  end
  def generate_download_pdf
    WickedPdf.new.pdf_from_string(
      ApplicationController.render(
        template: "proposals/proposal",
        layout: "pdf",
        assigns: { proposal: @proposal, current_user: @current_user }
      )
    )
  end
end
