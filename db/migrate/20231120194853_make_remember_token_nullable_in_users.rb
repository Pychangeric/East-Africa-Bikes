class MakeRememberTokenNullableInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :remember_token, true
  end
end
