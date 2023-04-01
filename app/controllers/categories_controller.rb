class CategoriesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    cat = Category.all

    if cat.present?
      render json: cat.as_json(only: [:id, :name, :description]), status: :ok
    else
      app_response(message: 'No categories found', status: :not_found)
    end
  end

  def create
    cat = user.category.build(category_params)

    if cat.save
      app_response(status: :created, message: 'Category created successfully', data: cat)
    else
      app_response(status: :unprocessable_entity, message: 'Category creation failed', data: cat.errors)
    end
  end

  def show
    cat = Category.find_by(id: params[:id])

    if cat
      app_response(message: 'Category found successfully', status: :ok, data: cat)
    else
      app_response(message: 'Category not found', status: :not_found)
    end
  end

  private

  def category_params
    params.permit(:id, :name, :description)
  end

  def record_not_found(exception)
    app_response(message: exception.message, status: :not_found)
  end

  def app_response(message:, status:, data: {})
    response = { message: message, data: data }
    render json: response, status: status
  end
end
