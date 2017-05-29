class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.text :description
      t.string :title
      t.integer :total_members
      t.string :theme
      t.string :art_types
      t.integer :budget
      t.date :date
      t.string :location
      t.text :mail_content
      t.boolean :done

      t.timestamps
    end
  end
end
