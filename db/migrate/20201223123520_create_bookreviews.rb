class CreateBookreviews < ActiveRecord::Migration[6.0]
  def change
    create_table :bookreviews do |t|
      t.string :author     ,null: false, default: ""
      t.text :text         ,null: false
      t.integer :genre_id  ,null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
