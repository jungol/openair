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

require 'rails_helper'

RSpec.describe Citation, :type => :model do

  let(:citation) { Citation.new(citing_id: 1, cited_id: 2) }
  subject { citation }

  it { should respond_to(:citing) }
  it { should respond_to(:citing_id)}
  it { should respond_to(:cited) }
  it { should respond_to(:cited_id)}

  it { should validate_presence_of(:citing_id)}
  it { should validate_presence_of(:cited_id)}

  it "is valid with citing_id, cited_id" do
    expect(citation).to be_valid
  end

  it "is invalid when citing_id and cited_id are equal" do
    citation = Citation.new(citing_id: 1, cited_id: 1)
    citation.valid?
    expect(citation.errors[:cited_id]).to include('article cannot cite itself!')
  end


  it { should belong_to(:citing) }
  it { should belong_to(:cited) }

  # Class Methods
  context "builds citation (#self.build_citation)" do
    
    before :each do
      @article = Article.new(title: "Adam Smith's Second Cousin", first_page: 200, last_page: 217)
      publication = Publication.new(year: 1776, issue: 1, volume: 2)
      journal = Journal.create(name: "Journal of Economics")
      journal.publications << publication
      publication.articles << @article
      author = Author.new(first_name: "Justin", last_name: "Biebz")
      @article.authors << author
    end

    specify "with one author" do
      expect(Citation.build_citation(@article)).to eq(
        "Biebz, J.(1776). Adam Smith's Second Cousin. Journal of Economics, 2(1), pp. 200 - 217."
      )
    end

    specify "with two authors" do
      author = Author.new(first_name: "Selena", last_name: "Gomez")
      @article.authors << author
      expect(Citation.build_citation(@article)).to eq(
        "Biebz, J., & Gomez, S.(1776). Adam Smith's Second Cousin. Journal of Economics, 2(1), pp. 200 - 217."
      )
    end
  end

  # Instance Methods


end





