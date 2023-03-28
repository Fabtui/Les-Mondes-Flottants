class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_presence_of :address, on: :create, message: "Merci d'ajouter votre adresse"
  validates_presence_of :name, on: :create, message: "Merci d'ajouter un nom d'utilisateur"
  validates :start_time, format: { with: /\d{1,2}:\d{2}/, message: "exemple: 9:45 ou 13:00" }
  validates :end_time, format: { with: /\d{1,2}:\d{2}/, message: "exemple: 9:45 ou 13:00" }
  has_many :appointments, dependent: :destroy
  has_many :tattoos, dependent: :destroy
  has_many :flashes, dependent: :destroy
  has_one_attached :profile_pic
  has_one_attached :photo1

  def self.artists
    User.where(artist: true)
  end

  def artist_appointments
    Appointment.where(artist_id: self.id).sort_by(&:date).select { |a| a.date > Date.yesterday }
  end
end
