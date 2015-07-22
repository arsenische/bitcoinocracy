class CreateSignatures < ActiveRecord::Migration
  def change
    create_table :signatures do |t|
      t.references :argument, index: true
      t.boolean :is_negation?, default: false
      t.string :signature
      t.references :bitcoin_address, index: true

      t.timestamps
    end

    add_index :signatures, [:argument_id, :bitcoin_address_id]
  end
end
