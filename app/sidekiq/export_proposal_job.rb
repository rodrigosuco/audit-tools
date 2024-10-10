class ExportProposalJob
  include Sidekiq::Job
  sidekiq_options retry: false
  attr_reader :proposal, :file_path

  def perform(proposal_data)
    @proposal = Proposal.new(proposal_data)
    pdf_content = ::PdfGeneratorService.new(proposal).generate_pdf

    @file_path = Rails.root.join('public', 'pdfs', "#{proposal.title}.pdf")

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
