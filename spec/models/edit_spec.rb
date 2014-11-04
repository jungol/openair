require 'rails_helper'

RSpec.describe Edit, :type => :model do
  let(:article) { FactoryGirl.create(:article)}
  let(:author) { FactoryGirl.create(:author)}
  let(:publication) { FactoryGirl.create(:publication)}
  let(:edit) { author.edits.build(article_id: article.id) }
  
  subject { edit }
  it { should be_valid }
  it { should respond_to(:author)}
  it { should respond_to(:article)}

  describe "when article is not present" do
    before { edit.article_id = nil }
    it { should_not be_valid}
  end

  describe "when author is not present" do
    before { edit.author_id = nil }
    it { should_not be_valid}
  end
end
