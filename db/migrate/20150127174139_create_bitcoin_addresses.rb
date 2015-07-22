class CreateBitcoinAddresses < ActiveRecord::Migration
  def change
    create_table :bitcoin_addresses do |t|
      t.string :bitcoin_address, unique: true
      t.integer :balance, default: 0, limit: 8

      t.timestamps
    end
  end
end
