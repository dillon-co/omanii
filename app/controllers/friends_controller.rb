class FriendsController < ApplicationController

  def create
    ActionController::Parameters.permit_all_parameters = true
    all_form_friends = params["_json"]
    friend_numbers = all_form_friends.map { |f| f["number"]}
    current_friends = Friend.where(number: friend_numbers).pluck(:number)
    new_friends = (friend_numbers - current_friends).map do |f|
      all_form_friends.select { |af| af["number"] == f }
    end
    Friend.create(new_friends)
    all_added_friends_ids = Friend.where(number: friend_numbers).ids
    if user_signed_in?
      all_added_friends_ids.each { |new_friend_id| current_user.friendships.find_or_create_by(friend_id: new_friend_id) }
    else
      cookies[:friend_ids] = all_added_friends_ids
    end
  end

  def best_friends
  end

  def index
    if user_signed_in?
      @users_friends = current_user.friends.all
      # @best_friends = Friend.find_by(number: current_user.number).users
      puts "\n\n\n\n\n\n\n\n\n#{@users_friends.as_json}\n\n\n\n\n\n\n\n"
      # render json: {added_freinds: @users_friends, added_by: @best_friends}
      render json: @users_friends
    end
  end
end
