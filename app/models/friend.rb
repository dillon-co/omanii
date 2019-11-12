require 'plivo'
class Friend < ApplicationRecord
  include Plivo
  has_many :friendships
  has_many :users, through: :friendships

  def send_message(body: nil)
    if self.subscribed
      message = Message.all.sample
      users_list = "#{self.users.all.map(&:first_name).first(3).join(",")} and #{self.users.all.count - 3} more"
      unless body
        begin
          client = RestClient.new(ENV['PLIVO_AUTH_ID'], ENV['PLIVO_AUTH_TOKEN'])
          message_created = client.messages.create(
            '+14352529826',
            [self.number],
            "Hey #{self.first_name.titleize},\n #{message.body} \n\n-#{self.users.last.first_name} #{self.users.last.last_name}(sorry 'bout the bug)\n\n\nauto message from \nomanii.com\nAdd your friends because they'll appreciate it."
          )
        rescue
          puts "\n\n\nBroken Number! #{self.number}\n\n\n"

        end
      end
    end
  end



  def self.create_masters_friends(friend_list)
    User.find_by(email: 'dilloncortez@gmail.com').friends.create(friend_list)
  end

  def send_custom_message
  end
end
