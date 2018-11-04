class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name
      t.text :description
      t.references :platform, foreign_key: true
      t.decimal :price
      t.string :image

      t.timestamps
    end
  end
end
