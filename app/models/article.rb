class Article < ActiveRecord::Base
	has_one :publication, class_name: "Publication",
													foreign_key: "article_id"
	has_many :authors, through: :publication

  validates :title, presence: true
  # validates :author, presence: true
  VALID_YEAR_REGEX = /(19|20)\d{2}/i
  validates :year, presence: true,
		        inclusion: { in: 1900..Date.today.year, message: "should be a valid year between 1900 and today's date"},
	          format: { 
	            with: VALID_YEAR_REGEX, 
	            message: "should be a four-digit year"
	          }

end
