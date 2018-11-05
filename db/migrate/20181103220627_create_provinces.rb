# Migration Class
class CreateProvinces < ActiveRecord::Migration[5.2]
  def change
    create_table :provinces do |t|
      t.string :name
      t.decimal :tax_percent

      t.timestamps
    end
  end
end
