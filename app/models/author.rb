class Author < ActiveRecord::Base
	has_many :publications, class_name: "Publication",
													foreign_key: "author_id"
	has_many :articles, through: :publications

	before_save { self.first_name = first_name.humanize }
	validates :first_name, presence: true
	validates :last_name, presence: true

end