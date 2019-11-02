class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :body
      t.integer :click_back_count
      t.integer :unsubscribe_count
      t.integer :new_user_count
      t.integer :purchased_count

      t.timestamps
    end
  end
end
