class RemoveCreatedAtFromBitcoinAddress < ActiveRecord::Migration
  def change
    remove_column :bitcoin_addresses, :created_at, :datetime
  end
end
