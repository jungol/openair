class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.integer :issue
      t.integer :year
      t.integer :volume

      t.timestamps
    end
  end
end
