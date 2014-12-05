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
  subject { section }

  it { should respond_to(:heading) }
  it { should respond_to(:content) }
  it { should respond_to(:article_id) }

  it "is valid with heading, article_id" do
  	expect(build(:section)).to be_valid
  end

  it { should validate_presence_of(:heading) }
  it { should validate_presence_of(:article_id) }

  it { should belong_to(:article) }

end
