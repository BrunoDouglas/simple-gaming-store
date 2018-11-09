# Migration Class
class CreateProvinces < ActiveRecord::Migration[5.2]
  def change
    create_table :provinces do |t|
      t.string :name
      t.decimal :gst
      t.decimal :pst
      t.boolean :hst

      t.timestamps
    end
  end
end
