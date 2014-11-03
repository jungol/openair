require 'rails_helper'

RSpec.describe PublishedArticle, :type => :model do
  let(:article) { FactoryGirl.create(:article)}
  let(:author) { FactoryGirl.create(:author)}
  let(:publication) { FactoryGirl.create(:publication)}
  let(:published_article) { author.published_articles.build(article_id: article.id, 
  															publication_id: publication.id) }
  
  subject { published_article }
  it { should be_valid }
  it { should respond_to(:author)}
  it { should respond_to(:article)}
  it { should respond_to(:publication)}
  it { should respond_to(:journal)}

  describe "when article is not present" do
    before { published_article.article_id = nil }
    it { should_not be_valid}
  end

  describe "when author is not present" do
    before { published_article.author_id = nil }
    it { should_not be_valid}
  end

  describe "when publication is not present" do
  	pending("TODO: validation publication_id") do
  	  before { published_article.publication = nil}
  	  it { should_not be_valid}
    end
  end
end
