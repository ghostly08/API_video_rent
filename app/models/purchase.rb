class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :content, polymorphic: true

  validates :user_id, :price, :quality, :purchased_at, :content_type, :content_id, presence: true

  def content_available?
    return false if self.purchased_at.nil?
    self.purchased_at > 48.hours.ago
  end

  def can_purchase?
    recent_purchase = self.user.purchases.where(content: self.content).where("purchased_at > ?", 48.hours.ago).exists?

    if recent_purchase
      return false
    end

    return true
  end

end
