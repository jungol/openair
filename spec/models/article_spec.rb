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
  it "performs citation methods"

end








