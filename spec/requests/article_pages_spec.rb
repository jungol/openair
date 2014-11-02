require 'rails_helper'

RSpec.describe "ArticlePages" do
  describe "GET /article_pages" do
    it "works! (now write some real specs)" do
      get root_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /article/id" do
    let(:article) { Article.create(title: "article") }

    it "works" do
      get article_path(article)
      expect(response).to have_http_status(200)

    end
  end
end
