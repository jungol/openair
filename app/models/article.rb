# == Schema Information
#
# Table name: articles
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  abstract       :text
#  publication_id :integer
#

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
	has_many :copies
  has_many :users, :through => :copies

  #VALIDATIONS
  validates :title, presence: true #uniqueness: true
  validates :publication_id, presence: true

  def cite_me
    Citation.build_citation(self)
  end

  def cite!(article)
    citations.create!(cited_id: article.id)
  end

  def bibliography
    @bibliography = []
    cited_articles.each do |article|
      @bibliography << Citation.build_citation(article)
    end
    return @bibliography
  end
end


