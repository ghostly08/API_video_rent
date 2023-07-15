class Season < ApplicationRecord
  has_many :episodes, dependent: :destroy
  has_many :purchases, as: :content
  has_many :users, through: :purchases

  validates :title, presence: true, uniqueness: true
  validates :plot, presence: true
  validates :number, presence: true, uniqueness: true
end
