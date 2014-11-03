class RenamePublicationToPublishedArticle < ActiveRecord::Migration
  def change
  	rename_table :publications, :published_articles
  end
end
