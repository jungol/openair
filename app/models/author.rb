class Author < ActiveRecord::Base
	has_many :published_articles, class_name: "PublishedArticle",
													foreign_key: "author_id"
	has_many :articles, through: :published_articles

	before_save { self.first_name = first_name.humanize }
	validates :first_name, presence: true
	validates :last_name, presence: true

end