class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :author
      t.integer :rating
      t.text :comments
      t.references :bike, null: false, foreign_key: true

      t.timestamps
    end
  end
end
