# == Schema Information
#
# Table name: sections
#
#  id         :integer          not null, primary key
#  heading    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  article_id :integer
#  content    :text
#

require 'rails_helper'

RSpec.shared_examples "all section content" do
  let(:section) {create(:section)}

  it "returns the correct array on #section_array" do
    section.content = content
    section.section_content_to_array
    expect(section.content).to eq(array)
  end
end

RSpec.describe Section, :type => :model do
  let(:section) { Section.new }
  subject { section }

  it { should respond_to(:heading) }
  it { should respond_to(:content) }
  it { should respond_to(:article_id) }

  it "is valid with heading, article_id" do
  	expect(build(:section)).to be_valid
  end

  it { should validate_presence_of(:heading) }
  it { should validate_presence_of(:article_id) }

  it { should belong_to(:article) }

  describe "section content with" do
    
    describe "single paragraph" do
      let(:content) {"I think. Therefore, I am. Well, maybe not."}
      let(:array) {[["I think.", "Therefore, I am.", "Well, maybe not."]]}
      it_behaves_like "all section content"
    end
  
    describe "sentence that ends in a question mark" do
      let(:content) {"I think. Therefore, I am. Am I? Maybe not."}
      let(:array) {[["I think.", "Therefore, I am.", "Am I?", "Maybe not."]]}
      it_behaves_like "all section content"
    end

    describe "sentence that ends in an exclamation point" do
      let(:content) {"I think. Therefore, I am! Am I? Maybe not."}
      let(:array) {[["I think.", "Therefore, I am!", "Am I?", "Maybe not."]]}
      it_behaves_like "all section content"
    end

    describe "extra spaces between sentences" do
      let(:content) {"I think.     Therefore, I am.   Am I? Maybe not."}
      let(:array) {[["I think.", "Therefore, I am.", "Am I?", "Maybe not."]]}
      it_behaves_like "all section content"
    end

    describe "no content at all" do
      let(:content) {nil}
      let(:array) {[[""]]}
      it_behaves_like "all section content"
    end

    describe "multiple paragraphs" do
      let(:content) {"I think. \r\n\r\nTherefore, I am. \r\n\r\nAm I? Maybe not."}
      let(:array) {[["I think."], ["Therefore, I am."], ["Am I?", "Maybe not."]]}
      it_behaves_like "all section content"
    end

    describe "extra line breaks between paragraphs" do
      let(:content) {"I think. \r\n\r\nTherefore, I am. \r\n\r\n\r\n\r\nAm I? Maybe not."}
      let(:array) {[["I think."], ["Therefore, I am."], ["Am I?", "Maybe not."]]}
      it_behaves_like "all section content"
    end

  end
end
