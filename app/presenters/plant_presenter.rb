require 'delegate'

class PlantPresenter < SimpleDelegator
  def self.wrap(plants)
    plants.map { |plant| new(plant) }
  end

  def human_size
    case size
    when 'small'  then 'quite small'
    when 'medium' then 'almost tall'
    else 'so tall'
    end
  end

  def care_moments_needed
    CareMoment::MOMENTS.keys.select do |code|
      code_needed = __getobj__["#{code}_needed"]
      raise 'You forgot to include care status on your plant!' unless code_needed

      code_needed == 1
    end
  end
end
