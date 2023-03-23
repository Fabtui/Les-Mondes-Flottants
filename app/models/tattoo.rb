class Tattoo < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates_presence_of :photo, message: "Must have a photo"
  validates_presence_of :user
  validate :user_is_artist?

  private

  def user_is_artist?
    self.errors.add(:user, 'User must be an artist') unless self.user && self.user.artist
  end
end
