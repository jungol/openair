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

  it "responds to valid methods" do
  	expect(citation).to respond_to(:citing)
  	expect(citation).to respond_to(:cited)
  end

  it "is valid with citing_id, cited_id" do
    expect(citation).to be_valid
  end

  it "is invalid without a citing_id" do
  	citation.citing_id = nil
    citation.valid?
  	expect(citation.errors[:citing_id]).to include("can't be blank")
  end

  it "is invalid without a cited_id" do
    citation.cited_id = nil
    citation.valid?
    expect(citation.errors[:cited_id]).to include("can't be blank")
  end



  context "build_citation method" do
    before(:all) do 
      @article = FactoryGirl.create(:article)
      @article.title = "Adam Smith and Laissez Faire"
      publication = FactoryGirl.create(:publication, volume: 35, issue: 2, year: 1927)
      publication.articles << @article
      publication.journal.name = "Journal of Political Economy"
    end
    # it "works with 1 author" do
    #   @article.authors = []
    #   @article.authors << FactoryGirl.create(:author)
    #   expect(Citation.build_citation(@article)).to eq("Last_Name 1, F. (1927). Adam Smith and Laissez Faire. Journal of Political Economy, 35(2), pp. 437-456.")
    # end

    # it "works with multiple authors" do
    #   @article.authors = []
    #   2.times do
    #     @article.authors << FactoryGirl.create(:author)
    #   end
    #   expect(Citation.build_citation(@article)).to eq("Last_Name 2, F., & Last_Name 3, F. (1927). Adam Smith and Laissez Faire. Journal of Political Economy, 35(2), pp. 437-456.")
    # end
  end
end










