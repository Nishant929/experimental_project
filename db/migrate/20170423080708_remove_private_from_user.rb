class RemovePrivateFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :private, :boolean
  end
end
