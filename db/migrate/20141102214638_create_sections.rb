class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :heading

      t.timestamps
    end
  end
end
