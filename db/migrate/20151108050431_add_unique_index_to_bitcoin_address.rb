class AddUniqueIndexToBitcoinAddress < ActiveRecord::Migration
  def change
    add_index :bitcoin_addresses, :bitcoin_address, unique: true
  end
end
