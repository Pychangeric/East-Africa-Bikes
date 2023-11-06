class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.references :bike, null: false, foreign_key: true
      t.references :accessory, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
