# == Schema Information
#
# Table name: publications
#
#  id         :integer          not null, primary key
#  issue      :integer
#  year       :integer
#  volume     :integer
#  created_at :datetime
#  updated_at :datetime
#  journal_id :integer
#

require 'rails_helper'

RSpec.describe Publication, :type => :model do

  let(:publication) { Publication.new }
  subject { publication }

  it { should respond_to(:year) }
  it { should respond_to(:issue) }
  it { should respond_to(:volume) }
  it { should respond_to(:journal_id) }

  it "is valid with issue, year, volume, journal_id" do
  	expect(build(:publication)).to be_valid
  end

  it { should validate_presence_of(:year) }
  it { should validate_presence_of(:issue) }
  it { should validate_presence_of(:volume) }
  it { should validate_presence_of(:journal_id) }

  it { should belong_to(:journal) }

end
