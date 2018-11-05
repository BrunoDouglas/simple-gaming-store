# Migration Class
class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.integer :age
      t.integer :phone
      t.references :credential, foreign_key: true
      t.references :address, foreign_key: true

      t.timestamps
    end
  end
end
