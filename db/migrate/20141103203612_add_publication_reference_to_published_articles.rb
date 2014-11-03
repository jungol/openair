class AddPublicationReferenceToPublishedArticles < ActiveRecord::Migration
  def change
    add_reference :published_articles, :publication, index: true
  end
end
