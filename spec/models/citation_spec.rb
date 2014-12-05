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

  it { should belong_to(:citing) }
  it { should belong_to(:cited) }

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










