class Appointment < ApplicationRecord
  CATEGORIES = ['Premier RDV', 'Retouches', 'Contrôle', 'Séance tatouage']

  belongs_to :user
  validates_presence_of :category, on: :create, inclusion: { in: CATEGORIES }
  validates_presence_of :date, on: :create

  def self.categories
    CATEGORIES
  end
end
