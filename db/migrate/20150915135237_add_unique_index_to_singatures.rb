class AddUniqueIndexToSingatures < ActiveRecord::Migration
  def change
    add_index :signatures, [:argument_id, :bitcoin_address_id, :negation], unique: true, :name => :unique_signature
  end
end
