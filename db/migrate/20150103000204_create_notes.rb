class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :content
      t.string :location
      t.references :copy, index: true

      t.timestamps
    end
  end
end
