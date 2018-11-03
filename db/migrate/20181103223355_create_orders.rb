class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :customer, foreign_key: true
      t.date :order_date
      t.references :status, foreign_key: true

      t.timestamps
    end
  end
end
