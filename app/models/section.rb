# == Schema Information
#
# Table name: sections
#
#  id         :integer          not null, primary key
#  heading    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  article_id :integer
#  content    :text
#

class Section < ActiveRecord::Base
	
	#ASSOCIATIONS
	belongs_to :article

	#CALLBACKS

	#VALIDATIONS
	validates :article_id, presence: true
	validates :heading, presence: true

end
