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
  
  let(:article) { Article.new }
  subject { article }
  it { should respond_to(:title) }
  it { should respond_to(:abstract) }
  it { should respond_to(:authors) }
  it { should respond_to(:sections) }
  it { should respond_to(:citations) }
  it { should respond_to(:cited_articles) }
  it { should respond_to(:edits) }
  it { should respond_to(:cite!) }
  it { should respond_to(:citing_articles) }
  it { should respond_to(:reverse_citations) }
  it { should respond_to(:publication) }
  
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








