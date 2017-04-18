class RemoveColumnFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :city
    remove_column :users, :state
    remove_column :users, :oauth_expires_at
  end
end
