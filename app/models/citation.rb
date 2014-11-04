class Citation < ActiveRecord::Base

  #ASSOCIATIONS
  belongs_to :citing, class_name: "Article"
  belongs_to :cited, class_name: "Article"

  #VALIDATIONS
  validates :citing_id, presence: true
  validates :cited_id, presence: true

end
