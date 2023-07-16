class Movie < ApplicationRecord
  has_many :purchases, as: :content
  has_many :users, through: :purchases

  validates :title, presence: true, uniqueness: true
  validates :plot, presence: true
end
