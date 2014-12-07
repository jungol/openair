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
  validate :cannot_cite_self

  def self.build_citation(article)
    # authors = []
    # article.authors.each { |author| authors << "#{author.last_name}, #{author.first_name[0]}." }
    authors = article.authors.map{
     |author| "#{author.last_name}, #{author.first_name[0]}."
    }.join(', & ')
    year = article.publication_year
    journal = article.journal_name
    volume = article.publication_volume
    issue = article.publication_issue
    title = article.title
    return "#{authors}(#{year}). #{title}. #{journal}, #{volume}(#{issue}), pp. 437-456."
  end
  
  private

  def cannot_cite_self
    errors.add(:cited_id, 'article cannot cite itself!') if cited_id == citing_id
  end
end
