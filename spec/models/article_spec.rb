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
#  first_page     :integer
#  last_page      :integer
#

require 'rails_helper'

RSpec.describe Article, :type => :model do
  
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
  it { should respond_to(:pages)}

  it { should validate_presence_of(:title)}

  it "is valid with title" do
    article.title = "title"
    expect(article).to be_valid
  end

  it { should have_many(:edits) }
  it { should have_many(:authors) }
  it { should have_many(:sections) }
  it { should have_many(:citations) }
  it { should have_many(:cited_articles) }
  it { should have_many(:citing_articles) }
  it { should have_many(:copies) }
  it { should have_many(:users) }
  it { should belong_to(:publication)}
  

  it "is invalid with non-existent publication"
  

  # INSTANCE METHODS 
  it "builds its own citation (#cite_me)" do
    article = create(:article)
    expect(article.cite_me).to eq(Citation.build_citation(article)) 
  end

  it "cites another article (#cite!)" do
    article = create(:article)
    other_article = create(:article)
    article.cite!(other_article)
    expect(article.cited_articles).to include(other_article)
  end

  it "builds its own bibliography (#bibliography)" do
    article = create(:article)
    other_article_1 = create(:article)
    other_article_2 = create(:article)
    article.cited_articles << other_article_1
    article.cited_articles << other_article_2
    bibliography = [ 
      Citation.build_citation(other_article_1),
      Citation.build_citation(other_article_2)
    ]
    expect(article.bibliography).to eq(bibliography)
  end

  it "creates array of shelf citations (#shelf_citations)" do
    user = create(:user)
    3.times do |n|
      user.articles << create(:article)
    end
    citations = user.articles.map(&:cite_me)
    expect(user.shelf_citations).to eq(citations)
  end

  context "orders articles alphabetically by author last name" do
    specify "with one author per article" do
      last_names = ["Smith", "Bieber", "Barhydt"]
      last_names.each do |last_name|
        author = create(:author, last_name: last_name)
        article = create(:article)
        article.authors << author
      end
      authors = []
      Article.all.each do |article|
        authors << article.authors.first
      end
      expect(authors[0].last_name).to eq("Barhydt")
      expect(authors[1].last_name).to eq("Bieber")
      expect(authors[2].last_name).to eq("Smith")
    end
    specify "with two authors per article" 
  end


end







