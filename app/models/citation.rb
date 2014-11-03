class Citation < ActiveRecord::Base

  belongs_to :citing, class_name: "Article"
  belongs_to :cited, class_name: "Article"

  validates :citing_id, presence: true
  validates :cited_id, presence: true

end
