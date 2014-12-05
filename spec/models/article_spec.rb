# == Schema Information
#
# Table name: articles
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  abstract       :text
#  publication_id :integer
#

require 'rails_helper'

RSpec.describe Article, :type => :model do
  
  let(:article) { Article.new }
  
  it "responds to valid methods" do
    expect(article).to respond_to(:title) 
    expect(article).to respond_to(:abstract) 
    expect(article).to respond_to(:authors) 
    expect(article).to respond_to(:sections)
    expect(article).to respond_to(:citations)
    expect(article).to respond_to(:cited_articles)
    expect(article).to respond_to(:edits)
    expect(article).to respond_to(:cite!)
    # expect(article).to respond_to(:citing?)
    expect(article).to respond_to(:citing_articles)
    expect(article).to respond_to(:reverse_citations)
    expect(article).to respond_to(:publication)
  end
  
  it "is valid with title" do
    expect(build(:article)).to be_valid
  end

  it "is invalid without title" do
    article.title = nil
    article.valid?
    expect(article.errors[:title]).to include("can't be blank")
	end

  it "is invalid with non-existent publication"

  it "performs citation methods"

end








