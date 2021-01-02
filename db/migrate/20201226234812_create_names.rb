class CreateNames < ActiveRecord::Migration[6.0]
  def change
    create_table :names do |t|
      t.string     :first_name,         null: false, default: ''
      t.string     :last_name,          null: false, default: ''
      t.string     :last_name_kana,     null: false, default: ''
      t.string     :first_name_kana,    null: false, default: ''
      t.date       :birth_date,         null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
