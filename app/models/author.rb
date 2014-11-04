class Author < ActiveRecord::Base
	has_many :edits, class_name: "Edit",
													foreign_key: "author_id"
	has_many :articles, through: :edits

	before_save { self.first_name = first_name.humanize }
	validates :first_name, presence: true
	validates :last_name, presence: true

end