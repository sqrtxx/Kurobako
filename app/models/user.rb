class User < ActiveRecord::Base

  has_secure_password

  validates :screen_name, presence: true, length: { in: 3..20 }, format: { with: /(^[A-Za-z0-9][\w]+)/i }
  validates :full_name, length: { maximum: 255 }
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates :description, length: { maximum: 255 }
  validates :password, length: { in: 7..20 }, format: { with: /(^[0-9a-zA-Z]+$)/ }

  before_create :create_remember_token

  scope :recent, -> { order('created_at DESC') }

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
