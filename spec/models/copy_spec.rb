# == Schema Information
#
# Table name: copies
#
#  id         :integer          not null, primary key
#  article_id :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Copy, :type => :model do
	let(:copy) { Copy.new(article_id: 1, user_id: 1) }
	subject { copy }

	it { should respond_to(:article_id)}
	it { should respond_to(:user_id)}
  it { should respond_to(:highlights)}

	it "is valid with article_id, user_id" do
		expect(copy).to be_valid	
	end

	it { should validate_presence_of(:article_id)}
	it { should validate_presence_of(:user_id)}

	it { should belong_to(:user)}
	it { should belong_to(:article)}
end
