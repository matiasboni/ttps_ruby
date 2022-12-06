class SubsidiariesController < ApplicationController
  before_action :set_subsidiary, only: %i[ show edit update destroy ]

  # GET /subsidiaries or /subsidiaries.json
  def index
    @subsidiaries = Subsidiary.paginate(page: params[:page],per_page: 10)
  end

  # GET /subsidiaries/1 or /subsidiaries/1.json
  def show
  end

  # GET /subsidiaries/new
  def new
    @subsidiary = Subsidiary.new
  end

  # GET /subsidiaries/1/edit
  def edit
  end

  # POST /subsidiaries or /subsidiaries.json
  def create
    @subsidiary = Subsidiary.new(subsidiary_params)

    respond_to do |format|
      if @subsidiary.save
        format.html { redirect_to subsidiary_url(@subsidiary), notice: "Subsidiary was successfully created." }
        format.json { render :show, status: :created, location: @subsidiary }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subsidiary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subsidiaries/1 or /subsidiaries/1.json
  def update
    respond_to do |format|
      if @subsidiary.update(subsidiary_params)
        format.html { redirect_to subsidiary_url(@subsidiary), notice: "Subsidiary was successfully updated." }
        format.json { render :show, status: :ok, location: @subsidiary }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subsidiary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subsidiaries/1 or /subsidiaries/1.json
  def destroy
    @subsidiary.destroy

    respond_to do |format|
      format.html { redirect_to subsidiaries_url, notice: "Subsidiary was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subsidiary
      @subsidiary = Subsidiary.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subsidiary_params
      params.require(:subsidiary).permit(:name, :address, :phone_number)
    end
end
