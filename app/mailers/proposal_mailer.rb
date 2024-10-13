# frozen_string_literal: true

class ProposalMailer < ApplicationMailer
  attr_reader :proposal, :company
  def proposal_email(proposal:)
    @proposal = proposal
    set_company
    attachments["#{proposal.title}.pdf"] = File.read("tmp/#{proposal.title}.pdf")
    mail(to: @company.contact_email, subject: "New Proposal - #{proposal.title}")
  end

  def set_company
    @company = Company.find(@proposal.company_id)
  end
end
