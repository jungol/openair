class AddPublicationReferenceToArticles < ActiveRecord::Migration
  def change
    add_reference :articles, :publication, index: true
  end
end
