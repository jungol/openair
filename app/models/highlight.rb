# == Schema Information
#
# Table name: highlights
#
#  id         :integer          not null, primary key
#  copy_id    :integer
#  location   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Highlight < ActiveRecord::Base
  belongs_to :copy

  #VALIDATIONS
  validates :location, presence: true
  validates :copy_id, presence: true
  validates :location, :uniqueness => {:scope => [:copy_id]}

end
