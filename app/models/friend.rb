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
    begin
      if self.subscribed
        message = Message.all.sample
        marketing_message = "Sorry for not hearing from us for a while. There were some bugs we had to fix. If you added friends to be texted, they probably didn't save. Log on to double check."
        unless body
            message_body = "Hey #{self.first_name.titleize},\n #{message.body} \n\n this is an automated message from\nomanii.com\n\n you were added by #{user_list}\n\n#{marketing_message}"
            create_plivo_message(message_body)
        else
          message_body = "Hey #{self.first_name.titleize},\n\n#{body} \n\nautomated message from\nomanii.com\n\n Someone new added you. Click the link to see who."
          create_plivo_message(message_body)
        end
      end
    rescue
      puts "\n\n\nBroken Number! #{self.number}\n\n\n"
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

  def self.check_user_list_method_on_prod
    self.all.map do |f|
      {f.id: f.user_list}
    end
  end

  private

  def user_list
    users_count = users.count
    case users_count
    when users_count > 2
      who_from = "#{users.last.first_name.titleize}, #{users.last(2).first.frst_name.titleize} and #{users_count - 2} more"
    when users_count == 2
      who_from = "#{users.last.first_name.titleize} and #{users.last(2).first.first_name.titleize}"
    else
      who_from = users.last.first_name.titleize
    end
    who_from
  end
end
