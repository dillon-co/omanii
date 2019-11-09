class Message < ApplicationRecord
  include Plivo
  # def self.list_incomming_messages
  #   api = RestClient.new(ENV['PLIVO_AUTH_ID'], ENV['PLIVO_AUTH_TOKEN'])
  #     response = api.messages.list(
  #       limit: 5,
  #       offset: 0,
  #     )
  #     binding.pry
  # end
end
