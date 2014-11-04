class RenamePublishedArticlesToEdits < ActiveRecord::Migration
  def change
  	rename_table :published_articles, :edits
  end
end
