class PublishedArticle < ActiveRecord::Base
	belongs_to :author, class_name: "Author"
	belongs_to :article, class_name: "Article"
	belongs_to :publication, class_name: "Publication"
	validates :author_id, presence: true
	validates :article_id, presence: true
	#validates :publication_id, presence: true

end