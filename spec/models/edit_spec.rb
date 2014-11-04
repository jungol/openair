require 'rails_helper'

RSpec.describe Edit, :type => :model do
	let(:article) {FactoryGirl.create(:article)}
	let(:author) {FactoryGirl.create(:author)}
	before do
		article.authors << author
		@edit = article.edits.all.sample
	end

  it "responds to valid methods" do
  	expect(@edit).to respond_to(:author)
  	expect(@edit).to respond_to(:article)
  	expect(@edit).to be_valid
  end

  it "is invalid with no article" do
  	@edit.article_id = nil
    expect(@edit).not_to be_valid
  end

  it "is invalid with no author" do
  	@edit.author_id = nil
    expect(@edit).not_to be_valid
  end

end

