class Plant < ApplicationRecord
  ROOMS = %w(entrance living-room bedroom bathroom office)
  SIZES = %w(small medium tall)

  searchkick

  belongs_to :user
  has_many :care_moments, dependent: :destroy

  validates :name, presence: true

  scope :search_import, -> { includes(:user) }

  private

  def search_data
    {
      name:          name,
      age_in_months: age_in_months,
      size:          size,
      room:          room,
      photo_url:     photo_url,
      created_at:    created_at,
      user_nickname: user.nickname,
      user_level:    user.level,
      user: {
        id: user.id,
        nickname: user.nickname,
        level: user.level
      }
    }
  end
end
