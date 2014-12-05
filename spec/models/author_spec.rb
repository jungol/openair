# == Schema Information
#
# Table name: authors
#
#  id         :integer          not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Author, :type => :model do

	let(:author) { Author.new }

  it "responds to valid methods" do	  
	  expect(author).to respond_to(:first_name)
	  expect(author).to respond_to(:last_name)
	  expect(author).to respond_to(:articles)
	  expect(author).to respond_to(:edits)
  end

  it "is valid with first_name, last_name" do
    expect(build(:author)).to be_valid
  end
  
  it "is invalid without first name" do
    author.first_name = nil
    author.valid?
    expect(author.errors[:first_name]).to include("can't be blank")
  end

  it "is invalid without last name" do
    author.last_name = nil
    author.valid?
    expect(author.errors[:last_name]).to include("can't be blank")
  end

  describe "name validation" do
    let(:author) { build(:author) }
    
    context "with uncapitalized first or last name" do
      it "capitalizes the name" do
        author.first_name = "adam"
        author.save
        expect(author.reload.first_name).to eq("Adam")
      end
    end

    context "with name in all CAPS" do
      it "downcases all letters except the first" do
        author.first_name = "ADAM"
        author.save
        expect(author.reload.first_name).to eq("Adam")
      end
    end
  end
	
end
