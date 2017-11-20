class AddTokenToRoom < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :token, :string
    add_index :rooms, :token, unique: true
  end
end
