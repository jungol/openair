class Author < ActiveRecord::Base
	
	#ASSOCIATIONS
	has_many :edits
	has_many :articles, through: :edits

  #CALLBACKS
	before_save { self.first_name = first_name.humanize }

  #VALIDATIONS
	validates :first_name, presence: true
	validates :last_name, presence: true

end