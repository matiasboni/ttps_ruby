class UsersController < ApplicationController

  before_action :set_user, only: %i[ show destroy edit update ]
  #Para todas las acciones se necesita usuario autenticado.
  before_action :authenticate_user!
  #Acciones que solo puede realizar el admin.
  before_action :admin_only , only: %i[destroy edit update create new]
  #Si no es cliente puede visualizar el listado.
  before_action :not_client , only: %i[index]
  #Que detalles pueden observar los clientes y el personal bancario.
  before_action :see_details , only: %i[show]

    def index
      if current_user.admin?
        @users= User.all.order(role: :asc, email: :asc).paginate(page: params[:page],per_page: 8)
      elsif current_user.staff?
        @users= User.client.order(email: :asc).paginate(page: params[:page],per_page: 8)
      end
    end

    def show
    end

    def new
        @user = User.new
    end

    def create
      @user = User.new(user_params)
      respond_to do |format|
        if @user.save
          format.html { redirect_to user_url(@user), notice: "El usuario fue correctamente creado" }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    def edit
    end

    def update
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to user_url(@user), notice: "El usuario fue correctamente actualizado" }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @user.destroy
  
      respond_to do |format|
        format.html { redirect_to users_url, notice: "El usuario fue correctamente eliminado" }
        format.json { head :no_content }
      end
    end


    private 

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :role, :password , :subsidiary_id)
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

    def see_details
      if current_user.client? && current_user.id != params[:id].to_i
        render file: "#{Rails.root}/public/404.html", status: :not_found
      elsif current_user.staff?
        if current_user.id != params[:id].to_i && ! User.find_by(id:params[:id]).client?
            render file: "#{Rails.root}/public/404.html", status: :not_found
        end
      end
    end

end
