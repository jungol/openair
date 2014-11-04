require 'rails_helper'

RSpec.describe Section, :type => :model do
  let(:section) { FactoryGirl.create(:section) }
  subject { section }
  
  it "responds to valid methods" do
    expect(section).to respond_to(:article)
    expect(section).to respond_to(:content)
  end
end
