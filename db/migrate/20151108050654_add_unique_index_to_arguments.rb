class AddUniqueIndexToArguments < ActiveRecord::Migration
  def change
    add_index :arguments, :statement, unique: true
  end
end
