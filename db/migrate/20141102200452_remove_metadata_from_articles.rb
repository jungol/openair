class RemoveMetadataFromArticles < ActiveRecord::Migration
  def change
  	remove_column :articles, :journal
  	remove_column :articles, :year
  	remove_column :articles, :volume
  	remove_column :articles, :issue
  end
end
