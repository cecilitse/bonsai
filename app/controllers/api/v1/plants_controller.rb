module API
  module V1
    class PlantsController < ActionController::API
      def index
        @plants = Plant.order("created_at DESC")
        render json: PlantSerializer.render(@plants, root: :plants)
      end

      def show
        plant = Plant.find(params[:id])
        render json: PlantSerializer.render(plant, root: :plant)
      end
    end
  end
end
