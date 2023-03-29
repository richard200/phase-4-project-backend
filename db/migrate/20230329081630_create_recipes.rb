class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.string :instructions, null: false
      t.string :ingredients, null: false
      t.integer :prep_time,  null: false
      t.integer :user_id, null: false
      t.integer :category_id, null: false

      t.timestamps
    end
  end
end
