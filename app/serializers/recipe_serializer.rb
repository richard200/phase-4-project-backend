class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :title, :instructions, :ingredients, :prep_time
end
