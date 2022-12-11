class SubsidiariesController < ApplicationController
  before_action :set_subsidiary, only: %i[ show edit update destroy ]
  #Para todas las acciones se necesita usuario autenticado.
  before_action :authenticate_user!
  #Acciones que solo puede realizar el admin.
  before_action :admin_only , only: %i[destroy edit update create new]
  #Si no es cliente puede visualizar el listado y el detalle.
  before_action :not_client , only: %i[index show]

  # GET /subsidiaries or /subsidiaries.json
  def index
    @subsidiaries = Subsidiary.paginate(page: params[:page],per_page: 8)
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
        format.html { redirect_to subsidiary_url(@subsidiary), notice: "La sucursal fue creada exitosamente." }
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
        format.html { redirect_to subsidiary_url(@subsidiary), notice: "La sucursal fue actualizada exitosamente." }
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
      format.html { redirect_to subsidiaries_url, notice: "La sucursal ha sido eliminada." }
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
      params.require(:subsidiary).permit(:name, :address, :phone_number,
      bussiness_hours_attributes: [
                :id,
                :opening_time,
                :closing_time,
                :day,
                :_destroy,
            ])
    end

    def admin_only
      if not current_user.admin?
        render file: "#{Rails.root}/public/404.html", status: :not_found
      end
    end

    def not_client
      if current_user.client?
        render file: "#{Rails.root}/public/404.html", status: :not_found
      end
    end

    
end
