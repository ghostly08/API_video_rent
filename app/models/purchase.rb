class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :content, polymorphic: true

  def content_available?
    self.purchased_at > 48.hours.ago
  end

  def can_purchase?
    self.purchased_at.nil? || self.purchased_at < 48.hours.ago
  end

end
