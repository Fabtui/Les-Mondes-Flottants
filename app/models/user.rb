class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_presence_of :address, on: :create, message: "Merci d'ajouter votre adresse"

  has_many :appointments

  has_one_attached :profile_pic
  has_one_attached :photo1

  def self.artists
    User.where(artist: true)
  end
end
