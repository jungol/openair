class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.integer :author_id
      t.integer :article_id

      t.timestamps
    end

    add_index :publications, :author_id
    add_index :publications, :article_id
    add_index :publications, [:author_id, :article_id], unique: true
  end
end
