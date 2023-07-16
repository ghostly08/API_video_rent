class Season < ApplicationRecord
  has_many :episodes, dependent: :destroy
  has_many :purchases, as: :content, dependent: :destroy
  has_many :users, through: :purchases

  validates :title, :number, presence: true, uniqueness: true
  validates :plot, presence: true
end
