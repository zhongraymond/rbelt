class User < ActiveRecord::Base
  has_secure_password
  has_many :songs
  has_many :playlists, dependent: :destroy
  # has_many :commented_event, through: :events, source: :comment
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true, on: :create
  validates :password, presence: true, on: :create
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
