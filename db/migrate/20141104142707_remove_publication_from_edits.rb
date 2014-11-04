class RemovePublicationFromEdits < ActiveRecord::Migration
  def change
  	remove_column :edits, :publication
  end
end
