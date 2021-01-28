class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string "first_name"
      t.string "last_name"
      t.string "gender"
      t.text "introducer"
      t.string "image"
      t.integer "user_id"
      t.timestamps
    end
  end
end
