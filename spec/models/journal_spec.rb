require 'rails_helper'

RSpec.describe Journal, :type => :model do

  let(:journal) { FactoryGirl.create(:journal)}
  subject { journal }
  it { should respond_to(:name)}
  it { should respond_to(:publications)}
  it { should be_valid}

  describe "with invalid information:" do
    it "has no name" do
      journal.name = nil
      expect(journal).not_to be_valid

    end
  end

end
