require 'plivo'
class Friend < ApplicationRecord
  include Plivo
  has_many :friendships
  has_many :users, through: :friendships


  def self.send_bulk_message(body: nil)
    unless body
      self.all.each {|f| f.send_message}
    else
      self.all.each {|f| f.send_message(body)}
    end
  end

  def send_message(body: nil)
    if self.subscribed
      message = Message.all.sample
      # users_list = "#{self.users.all.map(&:first_name).first(3).join(",")} and #{self.users.all.count - 3} more"
      unless body
        begin
          message_body = "Hey #{self.first_name.titleize},\n #{message.body} \n\nautomated message from\nomanii.com\n\n Someone new added you. Click the link to see who."
          create_plivo_message(message_body)
        rescue
          puts "\n\n\nBroken Number! #{self.number}\n\n\n"
        end
      else
        message_body = "Hey #{self.first_name.titleize},\n\n#{body} \n\nautomated message from\nomanii.com\n\n Someone new added you. Click the link to see who."
        create_plivo_message(message_body)
      end
    end
  end

  def create_plivo_message(message_body)
    client = RestClient.new(ENV['PLIVO_AUTH_ID'], ENV['PLIVO_AUTH_TOKEN'])
    message_created = client.messages.create(
      '+14352529826',
      [self.number],
      message_body
    )
  end



  def self.create_masters_friends(friend_list)
    User.find_by(email: 'dilloncortez@gmail.com').friends.create(friend_list)
  end

  def send_custom_message
  end
end
