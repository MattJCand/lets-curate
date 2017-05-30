class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.boolean :status, default: false
      t.references :team, foreign_key: true
      t.references :member, foreign_key: true

      t.timestamps
    end
  end
end
