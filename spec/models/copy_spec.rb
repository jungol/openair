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

	it "responds to valid methods" do
		expect(copy).to respond_to(:article_id)
		expect(copy).to respond_to(:user_id)
	end

	it "is valid with article_id, user_id" do
		expect(copy).to be_valid	
	end

	it "is invalid without article_id" do
		copy.article_id = nil
		copy.valid?
		expect(copy.errors[:article_id]).to include("can't be blank")
	end

	it "is invalid without user_id" do
		copy.user_id = nil
		copy.valid?
		expect(copy.errors[:user_id]).to include("can't be blank")
	end

end
