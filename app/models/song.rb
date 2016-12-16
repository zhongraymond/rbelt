class Song < ActiveRecord::Base
  belongs_to :user
  has_many :playlists, dependent: :destroy
  has_many :users_added, through: :playlists, source: :user
  validates :title, :artist, length: { minimum: 2 }, presence: true, on: :create

end
