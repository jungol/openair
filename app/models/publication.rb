class Publication < ActiveRecord::Base
  has_many :articles
  belongs_to :journal
end
