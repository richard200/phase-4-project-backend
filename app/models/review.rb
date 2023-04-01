class Review < ApplicationRecord
    belongs_to :user
    belongs_to :recipe

    validates :user_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :recipe_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :rating, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 5 }
    
end
