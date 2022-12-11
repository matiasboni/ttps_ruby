class TurnsController < ApplicationController
  before_action :set_turn, only: %i[ show edit update destroy attend confirm_attend]
  #Para todas las acciones se necesita usuario autenticado.
  before_action :authenticate_user!
  #Acciones que solo puede realizar el personal bancario.
  before_action :staff_only , only: %i[index_staff attend confirm_attend]
  #Acciones que solo puede realizar el cliente.
  before_action :client_only , only: %i[new edit create update destroy index]
  #Que detalles de turnos pueden observar el cliente y el personal bancario.
  before_action :show_details , only: %i[show]

  # GET /turns or /turns.json
  def index
      @turns = Turn.where(client_id:current_user.id).order(date: :asc).paginate(page: params[:page],per_page: 8)
  end

  def index_staff
    @turns = Turn.where(subsidiary_id:current_user.subsidiary_id).order(date: :asc).paginate(page: params[:page],per_page: 8)
  end

  def attend
    if ! helpers.can_attend?(@turn)
      respond_to do |format|
        format.html { redirect_to index_turns_url, alert: "El turno no puede ser atendido ya que no se encuentra en el dia o en el horario." }
      end
    end
  end

  def confirm_attend
    respond_to do |format|
      if @turn.update(attend_params)
        format.html { redirect_to index_turns_url(@turn), notice: "El turno fue atendido." }
      else
        @turn.state=false
        @turn.staff_id=nil
        format.html { render :attend, status: :unprocessable_entity }
      end
    end
  end
  # GET /turns/1 or /turns/1.json
  def show
  end

  # GET /turns/new
  def new
    @turn = Turn.new
  end

  # GET /turns/1/edit
  def edit
    if @turn.date < DateTime.current
      respond_to do |format|
        format.html { redirect_to turns_url, alert: "El turno no puede ser editado porque ya ha pasado.Si es el mismo día y la sucursal sigue abierta,aun puede ser atendido,sino cancele el turno." }
      end
    end
  end

  # POST /turns or /turns.json
  def create
    @turn = Turn.new(turn_params)
    @turn.client_id= current_user.id
    respond_to do |format|
      if @turn.save
        format.html { redirect_to turn_url(@turn), notice: "El turno fue solicitado correctamente." }
        format.json { render :show, status: :created, location: @turn }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @turn.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /turns/1 or /turns/1.json
  def update
    respond_to do |format|
      if @turn.update(turn_params)
        format.html { redirect_to turn_url(@turn), notice: "El turno fue editado correctamente." }
        format.json { render :show, status: :ok, location: @turn }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @turn.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /turns/1 or /turns/1.json
  def destroy
    @turn.destroy

    respond_to do |format|
      format.html { redirect_to turns_url, notice: "El turno fue cancelado exitosamente." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_turn
      @turn = Turn.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def turn_params
      params.require(:turn).permit(:date, :motive , :subsidiary_id)
    end

    def attend_params
      params.require(:turn).permit(:result, :state , :staff_id)
    end

    def staff_only
      if not current_user.staff?
        render file: "#{Rails.root}/public/404.html", status: :not_found
      elsif @turn!=nil && current_user.subsidiary_id != @turn.subsidiary_id
        render file: "#{Rails.root}/public/404.html", status: :not_found
      end
    end

    def client_only
      if not current_user.client? 
        render file: "#{Rails.root}/public/404.html", status: :not_found
      elsif @turn!=nil && current_user.id != @turn.client_id
        render file: "#{Rails.root}/public/404.html", status: :not_found
      end
    end

    def show_details
      if current_user.staff? && current_user.subsidiary_id != @turn.subsidiary_id
        render file: "#{Rails.root}/public/404.html", status: :not_found
      elsif current_user.client? && current_user.id != @turn.client_id
        render file: "#{Rails.root}/public/404.html", status: :not_found
      end
    end

end
