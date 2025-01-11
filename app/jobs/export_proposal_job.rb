class ExportProposalJob < ApplicationJob
  attr_reader :proposal, :file_path

  def perform(proposal_data, current_user)
    @proposal = Proposal.new(proposal_data)
    pdf_content = Pdfs::PdfGeneratorService.call(proposal, current_user)

    @file_path = Rails.root.join('tmp', "#{proposal.title}.pdf")

    File.open(file_path, 'wb') do |file|
      file << pdf_content
    end
    send_mail
  end

  def send_mail
    ProposalMailer.proposal_email(proposal: @proposal).deliver_now
    destroy_pdf
  end

  def destroy_pdf
    @file_path.delete if @file_path.exist?
  end
end
