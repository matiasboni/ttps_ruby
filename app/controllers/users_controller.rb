class UsersController < ApplicationController

  before_action :set_user, only: %i[ show destroy edit update ]

    def index
        @users= User.paginate(page: params[:page],per_page: 8)
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
      params.require(:user).permit(:email, :role, :password)
    end

end
