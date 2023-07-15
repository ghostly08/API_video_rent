class User < ApplicationRecord
  has_many :purchases

  validates :email, uniqueness: true, presence: true
end
