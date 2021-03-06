class Plant < ApplicationRecord
  ROOMS = %w(entrance living-room bedroom bathroom office)
  SIZES = %w(small medium tall)

  belongs_to :user
  has_many :care_moments, dependent: :destroy

  validates :name, presence: true

  def recalculate_care_points!
    update_attribute(:care_points, care_moments.sum(:points))
  end
end
