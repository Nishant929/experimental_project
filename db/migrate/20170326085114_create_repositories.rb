class CreateRepositories < ActiveRecord::Migration[5.0]
  def change
    create_table :repositories do |t|
      t.integer :rid
      t.string :rname
      t.string :type
      t.integer :dcount
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
