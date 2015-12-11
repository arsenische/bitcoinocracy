class RemoveIdFromSignature < ActiveRecord::Migration
  def change
    remove_column :signatures, :id, :integer
    change_column_null :signatures, :signature, false
    add_index :signatures, :signature, unique: true, :name => :unique_signature_primary
  end
end
