require 'rails_helper'

RSpec.describe Author, :type => :model do

	let(:author) { FactoryGirl.create(:author) }
  subject { author }

  it "responds to valid methods" do	  
	  expect(author).to respond_to(:first_name)
	  expect(author).to respond_to(:last_name)
	  expect(author).to respond_to(:articles)
	  expect(author).to respond_to(:edits)
	  expect(author).to be_valid 
  end
  
  it "fixes cases before save" do
    author.first_name = "AdAm"
    author.save
    expect(author.reload.first_name).to eq("Adam")
  end
	
  it "is invalid without first name" do
  	author.first_name = ""
  	expect(author).not_to be_valid
  end

  it "is invalid without last name" do
    author.last_name = ""
    expect(author).not_to be_valid
  end
end