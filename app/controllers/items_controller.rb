# frozen_string_literal: true

# class ItemsController
class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]
  before_action :set_proposal
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
    @standards = Standard.by_name
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    @proposal.items = Item.new(item_params)

    respond_to do |format|
      if @proposal.items.save
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
      if @proposal.items.update(item_params)
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
    @proposal.items.destroy!

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
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:standard_id, :stage, :year, :onsite_man_days, :off_site_man_days, :man_day_rate, :total_cost)
    end
end
