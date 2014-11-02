class AddArticleReferenceToSections < ActiveRecord::Migration
  def change
    add_reference :sections, :article, index: true
  end
end
