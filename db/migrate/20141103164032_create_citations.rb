class CreateCitations < ActiveRecord::Migration
  def change
    create_table :citations do |t|
      t.integer :citing_id
      t.integer :cited_id

      t.timestamps
    end
    add_index :citations, :citing_id
    add_index :citations, :cited_id
    add_index :citations, [:citing_id, :cited_id], unique: true
  end
end
