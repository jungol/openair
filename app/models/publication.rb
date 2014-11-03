class Publication < ActiveRecord::Base

  has_many :authors, through: :published_articles, class_name: "PublishedArticle"
  has_many :articles, through: :published_articles, class_name: "PublishedArticle"
  has_many :published_articles

end
