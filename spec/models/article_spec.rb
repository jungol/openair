require 'rails_helper'

describe Article do
  
  describe "with valid information" do

		let(:article) { FactoryGirl.create(:article) }
		subject { article }
		it { should respond_to(:title) }
		it { should respond_to(:abstract) }
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
    	article =  FactoryGirl.build(:article, author: "") 
    	subject { article }
    	pending
      expect(article).not_to be_valid
    end
  end
end