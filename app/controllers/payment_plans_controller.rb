class PaymentPlansController < ApplicationController
  def new
    @payment_plan = PaymentPlan.new
  end

  def create
    payment_plan = PaymentPlan.new(payment_plan_params)
    if payment_plan.save
      redirect_to profile_path
    end
  end

  private

  def payment_plan_params
    params.require(:payment_plan).permit()
  end
end
