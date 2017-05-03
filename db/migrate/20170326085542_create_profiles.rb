class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.integer :pid
      t.date :dob
      t.string :fname
      t.string :lname
      t.integer :phone_no
      t.string :city
      t.string :state
      t.string :country
      t.integer :zip_code
      t.integer :repos
      t.integer :followers
      t.integer :following
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
