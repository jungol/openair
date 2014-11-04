class Article < ActiveRecord::Base
	has_many :edits, class_name: "Edit",
													foreign_key: "article_id",
													dependent: :destroy
	belongs_to :publication
	has_many :authors, through: :edits
	has_many :sections
	has_many :citations, foreign_key: "citing_id"
	has_many :cited_articles, through: :citations, source: :cited
  has_many :reverse_citations, foreign_key: "cited_id",
  														 class_name: "Citation"
  has_many :citing_articles, through: :reverse_citations, source: :citing

  validates :title, presence: true

  def citing?(other_article)
    self.citations.find_by_cited_id(other_article.id)
  end

  def cite!(other_article)
  	self.citations.create!(cited_id: other_article.id)
  end

  def make_citation
    authors = []
    self.authors.each do |author|
      authors << "#{author.last_name}, #{author.first_name[0]}."
    end
    author_string = authors.map(&:inspect).join(', &')
    year_published = self.publication.year
    title = self.title
    #journal_name = self.publication.journal.name
    volume = self.publication.volume
    issue = self.publication.issue
    @citation = "#{author_string} (#{year_published}). #{title}. journal_name, #{volume}(#{issue}, pp. 437-456."
    return @citation
  end
  
end