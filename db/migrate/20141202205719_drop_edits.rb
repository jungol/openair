class DropEdits < ActiveRecord::Migration
  def change
  	drop_table :edits
  end
end
