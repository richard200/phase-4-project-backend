class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :reviews, dependent: :destroy


  # validates :title, presence: true, length: { minimum: 2 }
  # validates :description, presence: true, length: { minimum: 10 }
  # validates :user_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
  # validates :category_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
  
end
