class UsersController < ApplicationController

    def index
        @users= User.paginate(page: params[:page],per_page: 8)
    end

    def show
        @user = User.find_by_id(params[:id])
    end
end
