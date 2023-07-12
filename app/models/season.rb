class Season < ApplicationRecord
  has_many :episodes, dependent: :destroy
  has_many :purchases, as: :content
  has_many :users, through: :purchases
end
