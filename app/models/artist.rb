class Artist < ApplicationRecord
  has_one_attached :profile_pic
  has_one_attached :photo1
end
