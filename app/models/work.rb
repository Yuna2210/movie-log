class Work < ApplicationRecord
  belongs_to :director

  scope :by_position, -> { order(position: :asc) }

  acts_as_list
end
