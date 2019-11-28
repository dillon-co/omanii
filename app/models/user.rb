class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :friendships
  has_many :friends, through: :friendships


  def reformatted_number
    if self.number.first(2) != "+1"
      "+1#{self.number}"
    else
      self.number
    end
  end


end
