class Episode < ApplicationRecord
  belongs_to :season

  validates :title, :plot, :number, presence: true, uniqueness: { scope: :season_id}
end
