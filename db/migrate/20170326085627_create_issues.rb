class CreateIssues < ActiveRecord::Migration[5.0]
  def change
    create_table :issues do |t|
      t.integer :iid
      t.integer :assigned_id
      t.boolean :open
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
