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

  it "responds to valid methods" do
    expect(publication).to respond_to(:year)
  	expect(publication).to respond_to(:issue)
  	expect(publication).to respond_to(:volume)
  	expect(publication).to respond_to(:articles)
  	expect(publication).to respond_to(:journal)
  end

  it "is valid with issue, year, volume, journal_id" do
  	expect(build(:publication)).to be_valid
  end

  it "is invalid without issue" do
  	publication.issue = nil
  	publication.valid?
  	expect(publication.errors[:issue]).to include("can't be blank")
  end

  it "is invalid without year" do
  	publication.year = nil
  	publication.valid?
  	expect(publication.errors[:year]).to include("can't be blank")
  end

  it "is invalid without volume" do
  	publication.volume = nil
  	publication.valid?
  	expect(publication.errors[:volume]).to include("can't be blank")
  end

  it "is invalid without journal_id" do
  	publication.journal_id = nil
  	publication.valid?
  	expect(publication.errors[:journal_id]).to include("can't be blank")
  end
end
