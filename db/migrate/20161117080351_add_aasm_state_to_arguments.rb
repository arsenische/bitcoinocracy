class AddAasmStateToArguments < ActiveRecord::Migration
  def change
    add_column :arguments, :aasm_state, :string, default: 'visible'
  end
end
