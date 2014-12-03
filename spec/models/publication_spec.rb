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
