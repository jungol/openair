require 'rails_helper'

RSpec.describe PublishedArticle, :type => :model do
  let(:article) { FactoryGirl.create(:article)}
  let(:author) { FactoryGirl.create(:author)}
  let(:published_article) { author.published_articles.build(article_id: article.id) }
  
  subject { published_article }
  it { should be_valid }

  describe "when article is not present" do
    before { published_article.article_id = nil }
    it { should_not be_valid}
  end

  describe "when author is not present" do
    before { published_article.author_id = nil }
    it { should_not be_valid}
  end
end
