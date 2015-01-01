# == Schema Information
#
# Table name: highlights
#
#  id         :integer          not null, primary key
#  copy_id    :integer
#  location   :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Highlight, :type => :model do
  
  let(:highlight) { Highlight.new }

  it { should respond_to(:location) }
  it { should respond_to(:copy) }

  it { should validate_presence_of(:location)}
  it { should validate_presence_of(:copy_id)}

  it "validates uniqueness of highlight" do
    2.times do
      Highlight.create(copy_id: 1, location: 1)
    end
    expect(Highlight.count).to eq(1)

  end

  it "is valid with location, copy_id" do
    highlight.location = 2
    highlight.copy_id = 2
    expect(highlight).to be_valid
  end

end
