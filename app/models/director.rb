class Director < ApplicationRecord
  mount_uploader :image, DirectorImageUploader
  has_many :works
end
