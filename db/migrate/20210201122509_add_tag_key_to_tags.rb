class AddTagKeyToTags < ActiveRecord::Migration[6.0]
  def change
    add_column :tags, :tag_key, :string
  end
end
