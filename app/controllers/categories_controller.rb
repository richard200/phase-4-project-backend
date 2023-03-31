 class CategoriesController < ApplicationController
        def index
            cat = Category.all
            app_response(message: 'success', status: :ok, data: cat)
        end
        def create
            cat = Category.create!(category_params)
            app_response(message: 'Category created successfully', status: :created, data: :cat)
        end
        def show
            cat = Category.find_by(id: params[:id])
            if cat
              app_response(message: 'Category found successfully', status: :ok, data: cat)
            else
              app_response(message: 'Category not found', status: :not_found)
            end
          end
          #def destroy
            #category = Category.find_by(id: params[:id])
           # if category
              #category.destroy
              #app_response(message: 'Category deleted successfully', status: :ok)
            #else
             # app_response(message: 'Failed to delete category', status: :unprocessable_entity)
            #end
          #end
        private
        def category_params
            params.permit(:name, :description)
        end
 end

