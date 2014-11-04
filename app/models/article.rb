class Article < ActiveRecord::Base
	
  #ASSOCIATIONS
  belongs_to :publication
  has_many :edits
  has_many :authors, through: :edits
  has_many :sections
  has_many :citations, foreign_key: "citing_id"
  has_many :cited_articles, through: :citations, source: :cited
  has_many :reverse_citations, foreign_key: "cited_id",
                               class_name: "Citation"
  has_many :citing_articles, through: :reverse_citations, source: :citing
	
  #VALIDATIONS
  validates :title, presence: true #uniqueness: true
  validates :publication_id, presence: true

  def citing?(other_article)
    self.citations.find_by_cited_id(other_article.id)
  end

  def cite!(other_article)
  	self.citations.create!(cited_id: other_article.id)
  end

  def build_citation
    authors = []
    self.authors.each { |author| authors << "#{author.last_name}, #{author.first_name[0]}." }
    authors = authors.join(', & ')
    year = self.publication.year
    journal = self.publication.journal.name
    volume = self.publication.volume
    issue = self.publication.issue
    return "#{authors} (#{year}). #{title}. #{journal}, #{volume}(#{issue}), pp. 437-456."
  end
  
end