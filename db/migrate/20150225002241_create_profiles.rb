class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.date :birthday, null: false
      t.string :zip_code, null: false
      t.integer :user_id, null: false
    end
  end
end
