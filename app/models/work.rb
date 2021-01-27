class Work < ApplicationRecord
  mount_uploader :image, WorkImageUploader
  belongs_to :director
  validates :title, presence: true
  validates :relese, presence: true
  validates :main_actor, presence: true
  validates :description, presence: true
  validates :title, uniqueness: true
  scope :by_position, -> { order(position: :asc) }

  acts_as_list
end
