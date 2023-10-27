class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :venue
      t.date :date
      t.decimal :fees

      t.timestamps
    end
  end
end
