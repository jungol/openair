# == Schema Information
#
# Table name: journals
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Journal, :type => :model do

  let(:journal) { Journal.new }
  
  it "responds to valid methods" do
  	expect(journal).to respond_to(:name)
    expect(journal).to respond_to(:publications)
  end

  it "is valid with name" do
    expect(build(:journal)).to be_valid
  end

  it "is invalid without name" do
  	journal.name = nil
    journal.valid?
  	expect(journal.errors[:name]).to include("can't be blank")
  end

end
