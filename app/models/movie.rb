class Movie < ApplicationRecord
  has_many :purchases, as: :content
  has_many :users, through: :purchases
end
