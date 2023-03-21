class Tattoo < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates_presence_of :user_id, if: :user_is_artist?

  def user_is_artist?
    user = User.find(user_id)
    user.artist
  end
end
