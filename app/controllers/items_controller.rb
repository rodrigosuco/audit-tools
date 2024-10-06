# frozen_string_literal: true

# class ItemsController
class ItemsController < ApplicationController
  load_and_authorize_resource
  before_action :set_proposal
  before_action :set_item, only: %i[show edit update destroy]
  before_action :set_standards, only: %i[new create edit update]
  # GET /items or /items.json
  def index
    @items = Item.all
  end

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    @item = @proposal.items.build(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to proposal_url(@proposal), notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to proposal_url(@proposal), notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy

    respond_to do |format|
      format.html { redirect_to proposal_url(@proposal), notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_proposal
      @proposal = Proposal.find(params[:proposal_id])
    end

    def set_item
      @item = @proposal.items.find(params[:id])
    end

    def set_standards
      @standards = Standard.by_name
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:standard_id, :stage, :year, :onsite_man_days, :off_site_man_days, :man_day_rate, :total_cost, :proposal_id)
    end
end
