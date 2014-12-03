# == Schema Information
#
# Table name: edits
#
#  id         :integer          not null, primary key
#  author_id  :integer
#  article_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Edit < ActiveRecord::Base
  #ASSOCIATIONS  
  belongs_to :author, class_name: "Author"
  belongs_to :article, class_name: "Article"

  #VALIDATIONS
  validates :author_id, presence: true
  validates :article_id, presence: true
end
