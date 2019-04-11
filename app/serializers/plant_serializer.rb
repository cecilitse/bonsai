class PlantSerializer < Blueprinter::Base
  identifier :id

  fields  :name,
          :age_in_months,
          :size,
          :room,
          :photo_url,
          :user_id
end
