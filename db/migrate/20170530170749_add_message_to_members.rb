class AddMessageToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :message, :text
  end
end
