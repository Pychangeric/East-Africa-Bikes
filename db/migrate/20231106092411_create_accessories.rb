class CreateAccessories < ActiveRecord::Migration[7.0]
  def change
    create_table :accessories do |t|
      t.string :name
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
