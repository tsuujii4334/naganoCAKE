class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer, null: false
      t.string :postal_code, null: false
      t.integer :payment_method, null: false, default: "0"
      t.integer :total_amount, null: false
      t.integer :postage, null: false
      t.string :address, null: false
      t.string :addressee, null: false
      t.timestamps
    end
  end
end
