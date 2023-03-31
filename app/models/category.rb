class Category < ApplicationRecord
    has_many :recipes, dependent: :destroy

    validates :name, presence: true, length: { minimum: 2 }
    validates :description, presence: false, allow_nil: true, length: { minimum: 10 }
    
end
