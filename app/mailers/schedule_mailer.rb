# frozen_string_literal: true

class ScheduleMailer < ApplicationMailer
  def confirm_mail(item:)
    @item = item
    @user = User.find(@item.user_id)
    @proposal = @item.proposal
    @company = @proposal.company

    mail to: @user.email, subject: "Your next audit on #{@company.sales_name} has been confirmed!"
  end

  def cancel_mail(item:, last_auditor_id:)
    @item = item
    @user = User.find(last_auditor_id)
    @proposal = @item.proposal
    @company = @proposal.company

    mail to: @user.email, subject: "Your next audit on #{@company.sales_name} has been canceled!"
  end
end
