require 'rails_helper'

RSpec.describe "ArticlePages" do
  
  let(:article) { FactoryGirl.create(:article) }

  it "loads article dashboard (GET /)" do
    get root_path
    expect(response).to have_http_status(200)
  end

  it "loads article (GET /article/id :action => show)" do
  	get article_path(article)
    expect(response).to have_http_status(200)
  end
end
