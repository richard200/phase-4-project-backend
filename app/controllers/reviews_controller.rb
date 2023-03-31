class ReviewsController < ApplicationController

        #before_action :authenticate_user!, only: [:create]
        def index
          reviews = Review.all
          app_response(message: 'Success', status: :ok, data: reviews)
        end
        def show
            review = Review.find_by(id: params[:id])
            if review
              app_response(message: 'Review found successfully', status: :ok, data: review)
            else
              app_response(message: 'Failed to find review', status: :not_found)
            end
          end
        def create
          review = Review.create!(review_params)
          if review
            app_response(message: "Review left successfully", status: :ok, data: review)
          else
            app_response(message: "There was a problem with leaving your review", status: :unprocessable_entity, data: review.errors)
          end
        end
        def destroy
            review = Review.find_by(id: params[:id])
            if review
              review.destroy
              app_response(message: 'Review deleted successfully', status: :ok)
            else
              app_response(message: 'Failed to delete review', status: :unprocessable_entity)
            end
          end
        private
        def review_params
          params.permit(:rating)
        end
    
end
