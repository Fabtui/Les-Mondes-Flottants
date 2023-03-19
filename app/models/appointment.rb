class Appointment < ApplicationRecord
  CATEGORIES = ['Premier RDV', 'Retouches', 'Contrôle', 'Séance tatouage']

  belongs_to :artist, class_name: "User"
  belongs_to :user, class_name: "User", optional: true
  validates_presence_of :category, on: :create, inclusion: { in: CATEGORIES }
  validates_presence_of :date, on: :create

  def self.categories
    CATEGORIES
  end
end
