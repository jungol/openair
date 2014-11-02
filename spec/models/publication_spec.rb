require 'rails_helper'

RSpec.describe Publication, :type => :model do
  let(:article) { FactoryGirl.create(:article)}
  let(:author) { FactoryGirl.create(:author)}
  let(:publication) { author.publications.build(article_id: article.id) }
  
  subject { publication }
  it { should be_valid }

  describe "when article is not present" do
    before { publication.article_id = nil }
    it { should_not be_valid}
  end

  describe "when author is not present" do
    before { publication.author_id = nil }
    it { should_not be_valid}
  end
end
