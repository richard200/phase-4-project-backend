class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :user_id, null: false
      t.integer :recipe_id, null: false
      t.integer :rating, null: false, default: 0

      t.timestamps
    end
  end
end
