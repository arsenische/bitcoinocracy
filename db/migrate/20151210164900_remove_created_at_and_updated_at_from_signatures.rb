class RemoveCreatedAtAndUpdatedAtFromSignatures < ActiveRecord::Migration
  def change
    remove_column :signatures, :updated_at, :datetime
    remove_column :signatures, :created_at, :datetime
  end
end
