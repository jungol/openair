class Author < ActiveRecord::Base
	before_save { self.first_name = first_name.humanize }
	validates :first_name, presence: true
	validates :last_name, presence: true

end