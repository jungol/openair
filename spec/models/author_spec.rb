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
  subject { author }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:articles) }
  it { should respond_to(:edits) }

  it { should validate_presence_of(:first_name)}
  it { should validate_presence_of(:last_name)}

  it "is valid with first_name, last_name" do
    author.first_name = "Adam"
    author.last_name = "Smith"
    expect(author).to be_valid
  end

  describe "validation of :name" do
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

  it { should have_many(:edits)}
  it { should have_many(:articles)}
	
end
