class Tag < ApplicationRecord
  SEEDS = YAML.load_file(Rails.root.join("db/data/tags.yml"))
  has_many :work_tags, dependent: :destroy
  has_many :works, through: :work_tags
end
