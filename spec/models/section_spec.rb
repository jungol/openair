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
  let(:section) { Section.new }
  
  it "responds to valid methods" do
    expect(section).to respond_to(:article)
    expect(section).to respond_to(:content)
  end

  it "is valid with heading, article_id" do
  	expect(build(:section)).to be_valid
  end

  it "is invalid without heading" do
  	section.heading = nil
  	section.valid?
  	expect(section.errors[:heading]).to include("can't be blank")
  end

  it "is invalid without article_id" do
  	section.article_id = nil
  	section.valid?
  	expect(section.errors[:article_id]).to include("can't be blank")
  end

end
