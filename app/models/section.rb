class Section < ActiveRecord::Base
	belongs_to :article
	before_save {self.heading = heading.humanize}
	validates :article_id, presence: true
end
