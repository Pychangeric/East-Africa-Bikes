class CreateSpecifications < ActiveRecord::Migration[7.0]
  def change
    create_table :specifications do |t|
      t.decimal :engine_size
      t.decimal :horsepower
      t.decimal :top_speed
      t.references :bike, null: false, foreign_key: true

      t.timestamps
    end
  end
end
