class Flash < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates_presence_of :photo, message: "Doit avoir une photo"
  validates_presence_of :user
  validate :user_is_artist?

  private

  def user_is_artist?
    self.errors.add(:user, 'User doit être un artiste') unless self.user && self.user.artist
  end
end
