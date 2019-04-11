module API
  module V1
    module Garden
      class PlantsController < API::V1::BaseController
        before_action :authorize_user, only: [:create]

        def create
          plant = Plant.new(plant_params)
          plant.user = current_user

          if plant.save
            render json: PlantSerializer.render(plant, root: :plant), status: :created
          else
            render json: { errors: plant.errors.messages }, status: :unprocessable_entity
          end
        end

        private

        def plant_params
          params.require(:plant).permit(
            :name,
            :age_in_months,
            :size,
            :room,
            :photo_url
          )
        end
      end
    end
  end
end
