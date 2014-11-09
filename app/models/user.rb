class User < ActiveRecord::Base
  scope :recent, -> { order('created_at DESC') }
end
