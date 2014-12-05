# == Schema Information
#
# Table name: edits
#
#  id         :integer          not null, primary key
#  author_id  :integer
#  article_id :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Edit, :type => :model do

	let(:edit) { Edit.new(author_id: 1, article_id: 1) }

	it "responds to valid methods" do
		expect(edit).to respond_to(:author_id)
		expect(edit).to respond_to(:article_id)
	end

	it "is valid with article_id, user_id" do
		expect(edit).to be_valid
	end

	it "is invalid without article_id" do
		edit.article_id = nil
		edit.valid?
		expect(edit.errors[:article_id]).to include("can't be blank")
	end

	it "is invalid without author_id" do
		edit.author_id = nil
		edit.valid?
		expect(edit.errors[:author_id]).to include("can't be blank")
	end

end
