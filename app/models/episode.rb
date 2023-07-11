class Episode < ApplicationRecord
  belongs_to :season

  validates :number, uniqueness: { scope: :season_id }
end
