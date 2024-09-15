class StandardsController < ApplicationController
  before_action :set_standard, only: %i[ show edit update destroy ]

  # GET /standards or /standards.json
  def index
    @standards = Standard.all
  end

  # GET /standards/1 or /standards/1.json
  def show
  end

  # GET /standards/new
  def new
    @standard = Standard.new
  end

  # GET /standards/1/edit
  def edit
  end

  # POST /standards or /standards.json
  def create
    @standard = Standard.new(standard_params)

    respond_to do |format|
      if @standard.save
        format.html { redirect_to standard_url(@standard), notice: "Standard was successfully created." }
        format.json { render :show, status: :created, location: @standard }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @standard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /standards/1 or /standards/1.json
  def update
    respond_to do |format|
      if @standard.update(standard_params)
        format.html { redirect_to standard_url(@standard), notice: "Standard was successfully updated." }
        format.json { render :show, status: :ok, location: @standard }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @standard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /standards/1 or /standards/1.json
  def destroy
    @standard.destroy!

    respond_to do |format|
      format.html { redirect_to standards_url, notice: "Standard was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_standard
      @standard = Standard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def standard_params
      params.require(:standard).permit(:name)
    end
end
