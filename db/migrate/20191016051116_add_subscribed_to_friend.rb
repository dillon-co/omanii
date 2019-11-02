class AddSubscribedToFriend < ActiveRecord::Migration[6.0]
  def change
    add_column :friends, :subscribed, :boolean, default: true
  end
end
