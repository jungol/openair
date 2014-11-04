class Publication < ActiveRecord::Base
  
  #ASSOCIATIONS
  belongs_to :journal
  has_many :articles
  
end
