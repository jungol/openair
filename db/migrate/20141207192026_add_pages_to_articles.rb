class AddPagesToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :first_page, :integer
    add_column :articles, :last_page, :integer
  end
end
