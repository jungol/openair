class RemovePublicationIdFromEdits < ActiveRecord::Migration
  def change
  	remove_column :edits, :publication_id
  end
end
