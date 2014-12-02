class CreateEdits < ActiveRecord::Migration
  def change
    create_table :edits do |t|
      t.integer :author_id
      t.integer :article_id

      t.timestamps
    end
  end
end
