class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :cid
      t.text :text
      t.datetime :time
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
