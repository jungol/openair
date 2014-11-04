class Journal < ActiveRecord::Base

  #ASSOCIATIONS 
  has_many :publications

  #VALIDATIONS
  validates :name, presence: true
end
