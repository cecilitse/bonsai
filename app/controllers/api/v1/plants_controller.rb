module API
  module V1
    class PlantsController < ActionController::API
      def index
        @plants = Plant.order("created_at DESC")
        render json: { plants: @plants }
      end
    end
  end
end
