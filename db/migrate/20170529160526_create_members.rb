class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.references :user, foreign_key: true
      t.references :team, foreign_key: true
      t.boolean :project_owner
      t.string :status

      t.timestamps
    end
  end
end
