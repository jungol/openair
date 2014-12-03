# == Schema Information
#
# Table name: citations
#
#  id         :integer          not null, primary key
#  citing_id  :integer
#  cited_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Citation < ActiveRecord::Base

  #ASSOCIATIONS
  belongs_to :citing, class_name: "Article"
  belongs_to :cited, class_name: "Article"

  #VALIDATIONS
  validates :citing_id, presence: true
  validates :cited_id, presence: true

  def self.build_citation(article)
    authors = []
    article.authors.each { |author| authors << "#{author.last_name}, #{author.first_name[0]}." }
    authors = authors.join(', & ')
    year = article.publication.year
    journal = article.publication.journal.name
    volume = article.publication.volume
    issue = article.publication.issue
    title = article.title
    return "#{authors} (#{year}). #{title}. #{journal}, #{volume}(#{issue}), pp. 437-456."
  end
  
end
