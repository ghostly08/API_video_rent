class Purchase < ApplicationRecord
  attr_accessor :content_available?

  belongs_to :user
  belongs_to :content, polymorphic: true

  def content_available?
    self.purchased_at < 48.hours.ago
      return false
  end

end
