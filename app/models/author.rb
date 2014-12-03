# == Schema Information
#
# Table name: authors
#
#  id         :integer          not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

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
