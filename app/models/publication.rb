# == Schema Information
#
# Table name: publications
#
#  id         :integer          not null, primary key
#  issue      :integer
#  year       :integer
#  volume     :integer
#  created_at :datetime
#  updated_at :datetime
#  journal_id :integer
#

class Publication < ActiveRecord::Base
  
  #ASSOCIATIONS
  belongs_to :journal
  has_many :articles

	#VALIDATIONS
  # validates :issue, presence: true
  # validates :year, presence: true
  # validates :volume, presence: true  
  # validates :journal_id, presence: true
end
