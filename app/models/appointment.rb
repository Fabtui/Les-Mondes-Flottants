class Appointment < ApplicationRecord
  CATEGORIES = ['Premier RDV', 'Retouches', 'Contrôle', 'Séance tatouage']

  belongs_to :user
  validates_presence_of :category, on: :create, inclusion: { in: CATEGORIES}

  def self.categories
    CATEGORIES
  end
end
