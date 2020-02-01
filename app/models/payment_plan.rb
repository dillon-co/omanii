class PaymentPlan < ApplicationRecord
  belongs_to :user

  enum type: {
    daily: 0,
    weekly: 1,
    monthly: 2,
  }

  def price
    if type == 'daily'
      pr = 99
    elsif type == 'weekly'
      pr = 39
    elsif type == 'monthly'
      pr = 19
    end
    return pr
  end  
end
