class AddPrivatePurchasedToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :private_purchased, :boolean
  end
end
