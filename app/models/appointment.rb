class Appointment < ApplicationRecord
  CATEGORIES = ['Premier RDV', 'Retouches', 'Contrôle', 'Séance tatouage']

  belongs_to :artist, class_name: "User"
  belongs_to :user, class_name: "User", optional: true
  validates :date, uniqueness: { scope: :artist_id }
  validates_presence_of :category, on: :create, inclusion: { in: CATEGORIES }
  validates_presence_of :date, on: :create
  validates_presence_of :name, on: :create
  validates_presence_of :email, on: :create, format: { with: /[a-z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+\/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/, message: "exemple: exemple@mail.com" }
  validates_presence_of :phone, on: :create, format: { with: /(?:(?:\+|00)33|0)\s*[1-9](?:[\s.-]*\d{2}){4}/, message: 'exemple: 0612345678' }

  def self.categories
    CATEGORIES
  end
end
