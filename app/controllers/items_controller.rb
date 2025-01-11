# frozen_string_literal: true

# class ItemsController
class ItemsController < ApplicationController
  load_and_authorize_resource
  before_action :set_proposal
  before_action :set_item, only: %i[show edit update destroy confirm_schedule cancel_schedule]
  before_action :set_standards, only: %i[new create edit update]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = @proposal.items.build(item_params)

    respond_to do |format|
      if @item.save
        @proposal.calc_total_cost
        format.html { redirect_to proposal_url(@proposal), notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        @proposal.calc_total_cost
        format.html { redirect_to proposal_url(@proposal), notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item.destroy

    respond_to do |format|
      format.html { redirect_to proposal_url(@proposal), notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def confirm_schedule
    if @item.update(item_params)
      if @item.start_time.present? && @item.onsite_man_days.present?
        @item.end_time = calculate_end_time(@item.start_time, @item.onsite_man_days)
        @item.save
      end
      ScheduleMailer.confirm_mail(item: @item).deliver_later
      redirect_to schedule_proposal_item_path(@proposal, @item), notice: "Item was successfully scheduled."
    else
      redirect_to schedule_proposal_item_path(@proposal, @item), alert: "Item was not successfully scheduled."
    end
  end

  def cancel_schedule
    last_auditor_id = @item.user_id
    if @item.update(start_time: nil, end_time: nil, user_id: nil)
      ScheduleMailer.cancel_mail(item: @item, last_auditor_id: last_auditor_id).deliver_later
      redirect_to schedule_proposal_item_path(@proposal, @item), notice: "Item was successfully cancelled."
    else
      redirect_to schedule_proposal_item_path(@proposal, @item), alert: "Item was not successfully cancelled."
    end
  end

  private

  def calculate_end_time(start_time, man_days)
    current_date = start_time
    days_added = 1.0
    while days_added < man_days
      current_date += 1.day
      days_added += 1.0 unless current_date.saturday? || current_date.sunday?
    end
    current_date
  end
    def set_proposal
      @proposal = Proposal.find(params[:proposal_id])
    end

    def set_item
      @item = @proposal.items.find(params[:id])
    end

    def set_standards
      @standards = Standard.by_name
    end

    def item_params
      params.require(:item).permit(:standard_id, :stage, :year, :onsite_man_days, :off_site_man_days, :man_day_rate,
                                   :total_cost, :proposal_id, :start_time, :end_time, :user_id)
    end
end
