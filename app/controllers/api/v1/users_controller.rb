class Api::V1::UsersController < ApplicationController

  def user_is_logged_in
    render json: user_signed_in?
  end



end
