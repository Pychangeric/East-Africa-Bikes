class AddImageToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :poster, :string
  end
end
