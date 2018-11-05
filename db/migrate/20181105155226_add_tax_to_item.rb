class AddTaxToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :tax, :decimal
  end
end
