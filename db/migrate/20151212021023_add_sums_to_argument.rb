class AddSumsToArgument < ActiveRecord::Migration
  def change
    add_column :arguments, :pros_sum, :integer, default: 0, limit: 8
    add_column :arguments, :cons_sum, :integer, default: 0, limit: 8
    add_column :arguments, :all_sum, :integer, default: 0, limit: 8
    add_column :arguments, :min_sum, :integer, default: 0, limit: 8
  end
end
