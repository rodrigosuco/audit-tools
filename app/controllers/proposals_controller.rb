class ProposalsController < ApplicationController
  load_and_authorize_resource
  before_action :set_proposal, only: %i[show edit update destroy]
  before_action :set_companies, only: %i[new edit create update]

  # GET /proposals or /proposals.json
  def index
    @proposals = Proposal.all
  end

  # GET /proposals/1 or /proposals/1.json
  def show
  end

  def export
    export_response
    redirect_to proposal_url(@proposal), notice: "The proposal export request was successful,
                                                   the company contact will receive it via email."
  end

  def download
    pdf_thread = Thread.new do
      PdfGeneratorService.new(@proposal, current_user).generate_download_pdf
    end

    pdf = pdf_thread.value

    send_data pdf,
              filename: "#{@proposal.title}.pdf",
              type: 'application/pdf',
              disposition: 'attachment'
  end


  # GET /proposals/new
  def new
    @proposal = Proposal.new
  end

  # GET /proposals/1/edit
  def edit
  end

  # POST /proposals or /proposals.json
  def create
    @proposal = Proposal.new(proposal_params)

    respond_to do |format|
      if @proposal.save
        format.html { redirect_to proposal_url(@proposal), notice: "Proposal was successfully created." }
        format.json { render :show, status: :created, location: @proposal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proposals/1 or /proposals/1.json
  def update
    respond_to do |format|
      if @proposal.update(proposal_params)
        format.html { redirect_to proposal_url(@proposal), notice: "Proposal was successfully updated." }
        format.json { render :show, status: :ok, location: @proposal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proposals/1 or /proposals/1.json
  def destroy
    @proposal.destroy!

    respond_to do |format|
      format.html { redirect_to proposals_url, notice: "Proposal was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def export_response
    ::ExportProposalJob.perform_async(@proposal.as_json, current_user.as_json)
  end

  def set_proposal
    @proposal = Proposal.find(params[:id])
  end

  def set_companies
    @companies = Company.by_name
  end

  # Only allow a list of trusted parameters through.
  def proposal_params
    params.require(:proposal).permit(:company_id, :title, :status, :discount, :due_date, :discount_type)
  end
end
