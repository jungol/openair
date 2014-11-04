require 'rails_helper'

RSpec.describe Publication, :type => :model do
  
  let(:publication) { FactoryGirl.create(:publication)}
  subject { publication }

  it "responds to valid methods" do
    expect(publication).to respond_to(:year)
  	expect(publication).to respond_to(:issue)
  	expect(publication).to respond_to(:volume)
  	expect(publication).to respond_to(:articles)
  	expect(publication).to respond_to(:journal)
  end
end
