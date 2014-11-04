class Section < ActiveRecord::Base
	
	#ASSOCIATIONS
	belongs_to :article

	#CALLBACKS
	before_save {self.heading = heading.humanize}

	#VALIDATIONS
	validates :article_id, presence: true

end
