class PagesController < ApplicationController

  def home
    if not user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
