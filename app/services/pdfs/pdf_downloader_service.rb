# app/services/pdf_generator_service.rb

module Pdfs
  class PdfDownloaderService < BaseService
    def initialize(proposal, current_user)
      @proposal = proposal
      @current_user = current_user
    end

    def execute
      download_pdf
    end

    private
    attr_reader :proposal, :current_user

      def download_pdf
        WickedPdf.new.pdf_from_string(
          ApplicationController.render(
            template: "proposals/proposal",
            layout: "pdf",
            assigns: { proposal: proposal, current_user: current_user }
          )
        )
      end
  end
end