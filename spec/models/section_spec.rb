# == Schema Information
#
# Table name: sections
#
#  id         :integer          not null, primary key
#  heading    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  article_id :integer
#  content    :text
#

require 'rails_helper'

RSpec.describe Section, :type => :model do
  let(:section) { FactoryGirl.create(:section) }
  subject { section }
  
  it "responds to valid methods" do
    expect(section).to respond_to(:article)
    expect(section).to respond_to(:content)
  end
end
