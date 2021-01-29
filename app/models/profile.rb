class Profile < ApplicationRecord
  mount_uploader :image, ProfileImageUploader
  belongs_to :user
end
