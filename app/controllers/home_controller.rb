class HomeController < ApplicationController
  def index
    @approved_proposals = Proposal.where(status: :approved).count
    @onhold_proposals = Proposal.where(status: :onhold).count
    @cancelled_proposals = Proposal.where(status: :cancelled).count
    @rejected_proposals = Proposal.where(status: :rejected).count
    @client_review_proposals = Proposal.where(status: :client_review).count
  end
end
