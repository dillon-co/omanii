# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
    if resource.save
      update_user_with_friends
    end
    # raise "hell"
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def update_user_with_friends
    unless cookies[:friend_ids] == ""
      new_friend_hashes = cookies[:friend_ids].split("&").map{|f| {friend_id: f.to_i}}
      new_friend_hashes.each {|nfh|resource.friendships.find_or_create_by(nfh)}
      cookies[:friend_ids] = ""
    end
  end
end
