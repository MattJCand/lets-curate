class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.string :reviewer_id
      t.string :reviewee_id

      t.timestamps
    end
    add_index :reviews, :reviewer_id
    add_index :reviews, :reviewee_id
  end
end
