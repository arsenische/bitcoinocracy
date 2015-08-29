class AddSlugToArguments < ActiveRecord::Migration
  def change
    add_column :arguments, :slug, :string
    add_index :arguments, :slug, unique: true
  end
end
