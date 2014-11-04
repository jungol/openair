require 'rails_helper'

RSpec.describe Author, :type => :model do

  describe "with valid information" do

	  let(:author) { FactoryGirl.create(:author) }

	  subject { author }
	  
	  it { should respond_to(:first_name)}
	  it { should respond_to(:last_name)}
	  it { should respond_to(:articles)}
	  it { should respond_to(:edits)}
	  it { should be_valid }

	  it "fixes upper- and lower-case letters before save" do
	  	author = FactoryGirl.create(:author, first_name: "dAvId")
	  	expect(author.first_name).to eq("David")
	  end

	  it "strips leading and trailing white space" do
	  end
	end

	describe "with invalid information:" do
    
    context "no first name" do

			let(:author) { FactoryGirl.build(:author, first_name: "")}
			subject { author }
			it { should_not be_valid }
		end

		context "no last name" do
			let(:author) { FactoryGirl.build(:author, last_name: "")}
			subject { author }
			it { should_not be_valid}
		end
  end
end
