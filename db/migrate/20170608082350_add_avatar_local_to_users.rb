class AddAvatarLocalToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :avatar_local, :string
  end
end
