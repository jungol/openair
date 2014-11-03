class Article < ActiveRecord::Base
	has_one :published_article, class_name: "PublishedArticle",
													foreign_key: "article_id",
													dependent: :destroy
	has_many :authors, through: :published_article
	has_many :sections
	has_many :citations, foreign_key: "citing_id"
	has_many :cited_articles, through: :citations, source: :cited
  has_many :reverse_citations, foreign_key: "cited_id",
  														 class_name: "Citation"
  has_many :citing_articles, through: :reverse_citations, source: :citing


  validates :title, presence: true

  def citing?(other_article)
    self.citations.find_by_cited_id(other_article.id)
  end

  def cite!(other_article)
  	self.citations.create!(cited_id: other_article.id)
  end
  
end
