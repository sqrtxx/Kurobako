class User < ActiveRecord::Base
  validates :screen_name, presence: true, length: { in: 3..20 }
  validates :full_name, length: { maximum: 255 }
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates :description, length: { maximum: 255 }
  validates :url, format: URI::regexp(%w(http https))

  scope :recent, -> { order('created_at DESC') }
end
