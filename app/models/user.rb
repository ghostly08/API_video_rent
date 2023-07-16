class User < ApplicationRecord
  has_many :purchases, dependent: :destroy

  validates :email, uniqueness: true, presence: true
end
