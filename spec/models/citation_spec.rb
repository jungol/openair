require 'rails_helper'

RSpec.describe Citation, :type => :model do

  let(:citing) { FactoryGirl.create(:article) }
  let(:cited)  { FactoryGirl.create(:article)}
  let(:citation) { citing.citations.build(cited_id: cited.id)}

  subject { citation }
  it { should be_valid }
  
  it "responds to citing methods" do
  	expect(citation).to respond_to(:citing)
  	expect(citation).to respond_to(:cited)
  	expect(citation.citing).to eq(citing)
  	expect(citation.cited).to eq(cited)
  end
  
  it "requires citing article to be valid" do
  	citation.citing = nil
  	expect(citation).not_to be_valid
  end

  it "requires cited article to be valid" do
    citation.cited = nil
    expect(citing).not_to be_valid
  end

  # Eventually make params.require (but not too important)
  # describe "accessible attributes" do
  # 	it "should not allow access to citing_id" do
  # 		expect do
  # 			Citation.new(citing_id: citing.id)
  # 		end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
  # 	end
  # end


end
