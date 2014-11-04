require 'rails_helper'

RSpec.describe Citation, :type => :model do

  let(:article) { FactoryGirl.create(:article) }
  let(:other_article)  { FactoryGirl.create(:article)}
  let(:citation) { article.citations.build(cited_id: other_article.id)}

  subject { citation }
  
  it "responds to valid methods" do
  	expect(citation).to respond_to(:citing)
  	expect(citation).to respond_to(:cited)
  	expect(citation.citing).to eq(article)
  	expect(citation.cited).to eq(other_article)
  	expect(citation).to be_valid 
  end
  
  it "is invalid without a citing article" do
  	citation.citing = nil
  	expect(citation).not_to be_valid
  end

  it "is invalid without a cited article" do
    citation.cited = nil
    expect(citation).not_to be_valid
  end
  
end
