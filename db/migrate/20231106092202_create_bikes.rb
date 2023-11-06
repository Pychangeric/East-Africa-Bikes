class CreateBikes < ActiveRecord::Migration[7.0]
  def change
    create_table :bikes do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.text :engine_specifications
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
