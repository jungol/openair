require 'rails_helper'

describe Article, :type => :model do
  
  describe "with valid information" do

		let(:article) { FactoryGirl.create(:article) }
		subject { article }
		it { should respond_to(:title) }
		it { should respond_to(:abstract) }
		it { should respond_to(:authors) }
		it { should respond_to(:sections)}
    it { should respond_to(:citations)}
    it { should respond_to(:cited_articles)}
    it { should respond_to(:edits)}
    it { should respond_to(:cite!)}
    it { should respond_to(:citing?)}
    it { should respond_to(:citing_articles)}
    it { should respond_to(:reverse_citations)}
    it { should respond_to(:publication)}
		it { should be_valid }
	
	end

	describe "with invalid information:" do
    
    context "no title" do
      
      let(:article) { FactoryGirl.build(:article, title: "" ) }
    	subject { article }
      it { should_not be_valid }
		end
    
    it "has no author" do
      pending
    	article =  FactoryGirl.build(:article)
      expect(article).not_to be_valid
    end
  end

  describe "citations" do
    let(:article_1) { FactoryGirl.create(:article)}
    let(:article_2) { FactoryGirl.create(:article)}
    specify "are built with #cite!" do
      article_1.cite!(article_2)
      expect(article_1).to be_citing(article_2)
      expect(article_1.cited_articles).to include(article_2)
    end

    specify "can identify which articles cite me" do
      article_1.cite!(article_2)
      expect(article_2.citing_articles).to include(article_1)
    end
  end
end