class AddTokenExpirationToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :token_expiration, :string
  end
end
