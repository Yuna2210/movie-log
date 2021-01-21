class CreateWorks < ActiveRecord::Migration[6.0]
  def change
    create_table :works do |t|
      t.string "title"
      t.string "relese"
      t.string "main_actor"
      t.text "description"
      t.timestamps
    end

    create_table :directors do |t|
      t.string "name"
      t.string "country"
      t.timestamps
    end
  end
end
