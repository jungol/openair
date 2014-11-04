class Author < ActiveRecord::Base
	has_many :edits
	has_many :articles, through: :edits

	before_save { self.first_name = first_name.humanize }
	validates :first_name, presence: true
	validates :last_name, presence: true

end