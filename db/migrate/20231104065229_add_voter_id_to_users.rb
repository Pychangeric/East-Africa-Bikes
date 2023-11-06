class AddVoterIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :voter_id, :integer
  end
end
