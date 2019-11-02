class PagesController < ApplicationController

  def index
  end

  def home
  end

  def about
  end

  def profile
    unless user_signed_in?
      # save_new_friends_to_db
      redirect_to new_user_registration_path()
    end
  end

  private

  def save_new_friends_to_db
    # self.methods
  end
end
