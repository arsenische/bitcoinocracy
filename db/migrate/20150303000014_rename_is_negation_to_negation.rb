class RenameIsNegationToNegation < ActiveRecord::Migration
  def change
    rename_column :signatures, :is_negation?, :negation
  end
end
