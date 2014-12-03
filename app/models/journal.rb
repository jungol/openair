# == Schema Information
#
# Table name: journals
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Journal < ActiveRecord::Base

  #ASSOCIATIONS 
  has_many :publications

  #VALIDATIONS
  validates :name, presence: true
end
