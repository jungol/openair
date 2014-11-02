class Article < ActiveRecord::Base
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
