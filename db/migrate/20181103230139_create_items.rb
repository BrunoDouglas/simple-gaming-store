# Migration Class
class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :order, foreign_key: true
      t.decimal :price
      t.integer :quantity
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
