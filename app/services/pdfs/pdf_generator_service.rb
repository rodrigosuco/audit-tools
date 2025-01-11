# app/services/pdf_generator_service.rb

module Pdfs
  class PdfGeneratorService < BaseService
    def initialize(proposal, current_user)
      @proposal = proposal
      @current_user = current_user
    end

    def execute
      generate_pdf
    end

    private
    attr_reader :proposal, :current_user

      def generate_pdf
        ApplicationController.render(
          pdf: "proposal",
          template: "proposals/proposal",
          layout: "pdf",
          encoding: "UTF-8",
          assigns: { proposal: proposal, current_user: current_user }
        )
      end
  end
end
