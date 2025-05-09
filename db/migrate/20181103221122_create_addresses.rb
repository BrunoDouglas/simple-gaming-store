# Migration Class
class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :line1
      t.string :postal_code
      t.string :city
      t.references :province, foreign_key: true

      t.timestamps
    end
  end
end
