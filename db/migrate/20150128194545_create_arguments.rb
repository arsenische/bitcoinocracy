class CreateArguments < ActiveRecord::Migration
  def change
    create_table :arguments do |t|
      t.text :statement, :unique => true
      t.integer :validity, default: 0, limit: 8

      t.timestamps
    end
  end
end
