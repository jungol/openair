class Article < ActiveRecord::Base
	has_one :publication, class_name: "Publication",
													foreign_key: "article_id"
	has_many :authors, through: :publication

  validates :title, presence: true


end
