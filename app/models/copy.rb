# == Schema Information
#
# Table name: copies
#
#  id         :integer          not null, primary key
#  article_id :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Copy < ActiveRecord::Base
	#ASSOCIATIONS
	belongs_to :article
	belongs_to :user
  has_many :highlights

	#VALIDATIONS
	validates :user_id, presence: true
	validates :article_id, presence: true
	
end
