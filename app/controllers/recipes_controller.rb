class RecipesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    # before_action :authenticate_request, only: [:create, :update, :destroy]
    
     before_action :require_login, only: [:create, :destroy]
        def index
            recipes = Recipe.all
            app_response(message: 'success', status: :ok, data: ActiveModelSerializers::SerializableResource.new(recipes, each_serializer: RecipeSerializer).as_json)

        end

        def show
            recipe = Recipe.find_by(id: params[:id])
            if recipe
              render json: recipe, serializer: RecipeSerializer, status: :ok
            else
              app_response(message: 'Failed to find recipe', status: :not_found)
            end
        end
          

        def create
            recipe = Recipe.create!(recipe_params)
            if recipe
                app_response(message: 'Recipe created successfully', status: :created, data: recipe)
            else
                app_response(message: 'Something went wrong when trying to create your recipe', status: :unprocessable_entity, data: recipe.errors)
            end
        end

        def update
            recipe = Recipe.find_by(id: params[:id])
            if recipe.update(recipe_params)
                app_response(message: 'Recipe updated successfully', status: :ok, data: recipe)
            else
                app_response(message: 'Failed to update recipe', status: :unprocessable_entity, data: recipe.errors)
            end
        end

        def destroy
            recipe = Recipe.find_by(id: params[:id])
            if recipe
                recipe.destroy
                app_response(message: 'Recipe deleted successfully', status: :ok)
            else
                app_response(message: 'Failed to delete recipe', status: :unprocessable_entity)
            end
        end


        private

        def recipe_params
            params.permit(:title, :instructions, :ingredients, :prep_time)
        end

        def record_not_found(exception)
            app_response(message: exception.message, status: :not_found)
      end
        
    
end
