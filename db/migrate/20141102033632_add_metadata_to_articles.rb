class AddMetadataToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :journal, :string
    add_column :articles, :year, :integer
    add_column :articles, :volume, :integer
    add_column :articles, :issue, :integer
  end
end
