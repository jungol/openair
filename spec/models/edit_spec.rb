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
	subject { edit }

	it { should respond_to(:author_id)}
	it { should respond_to(:article_id)}

	it "is valid with article_id, user_id" do
		expect(edit).to be_valid
	end

	it { should validate_presence_of(:article_id)}
	it { should validate_presence_of(:author_id)}

	it { should belong_to(:article)}
	it { should belong_to(:author)}

end
