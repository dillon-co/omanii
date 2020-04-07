class PagesController < ApplicationController

  def index
  end

  def home
  end

  def about
  end

  def privacy_policy
  end


  def profile
    unless user_signed_in?
      # save_new_friends_to_db
      puts "\n\n\n\n\n\n\n\nMeow\n\n\n\n\n\n"
      redirect_to new_user_registration_path()
    else
      @friends = current_user.friends.all
      if current_user.number.present?
        best_friends = Friend.find_by(number: current_user.reformatted_number)
        if best_friends.present?
          @best_friends = best_friends.users
        else
          @best_friends = []  
        end
      end
    end
  end

  private

  def save_new_friends_to_db
    # self.methods
  end
end
