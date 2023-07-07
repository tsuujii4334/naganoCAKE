class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer
      t.string :postal_code
      t.integer :payment_method
      t.integer :total_amount
      t.integer :postage
      t.string :address
      t.string :addressee
      t.timestamps
    end
  end
end
