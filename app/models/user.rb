class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :friendships
  has_many :friends, through: :friendships


  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.first_name, user.last_name = auth.info.name.split(' ')
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def reformatted_number
    if self.number.first(2) != "+1"
      "+1#{self.number}"
    else
      self.number
    end
  end


end
