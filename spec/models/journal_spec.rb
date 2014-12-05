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
  subject { journal }

  it { should respond_to(:name)}

  it "is valid with name" do
    journal.name = "Journal of Economics"
    expect(journal).to be_valid
  end

  it { should validate_presence_of(:name)}

  it { should have_many(:publications)}


end
