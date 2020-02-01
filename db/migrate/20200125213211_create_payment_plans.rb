class CreatePaymentPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :payment_plans do |t|

      t.belongs_to :user

      t.integer :type
      t.boolean :has_paid?

      t.timestamps
    end
  end
end
