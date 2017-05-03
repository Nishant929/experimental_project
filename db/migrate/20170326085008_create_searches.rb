class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.integer :sid
      t.text :text
      t.datetime :time
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
