class RemoveReviewIdFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :review_id, :integer
  end
end
