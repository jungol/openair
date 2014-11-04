require 'rails_helper'

RSpec.describe Journal, :type => :model do

  let(:journal) { FactoryGirl.create(:journal)}
  subject { journal }
  
  it "responds to valid methods" do
  	expect(journal).to respond_to(:name)
    expect(journal).to respond_to(:publications)
    expect(journal).to be_valid
  end

  it "is invalid with no name" do
  	journal.name = nil
  	expect(journal).not_to be_valid
  end

end
