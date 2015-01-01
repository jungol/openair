class CreateHighlights < ActiveRecord::Migration
  def change
    create_table :highlights do |t|
      t.references :copy, index: true
      t.integer :location

      t.timestamps
    end
  end
end
