require 'rails_helper'

RSpec.describe HighlightsController, :type => :controller do

  it { should route(:post, '/highlights').to(action: :create)}

  before do 
    highlight = Highlight.create(copy_id: 1, location: 1)
    @copy_id = highlight.copy_id
    @location = highlight.location
    @id = highlight.id
  end

  describe "creating a highlight with Ajax" do
    it "incremements the highlight count" do
      expect do
        xhr :post, :create, highlight: {copy_id: @copy_id, location: 2}
      end.to change(Highlight, :count).by(1)
    end
    it "responds with success" do
      expect do
        xhr :post, :create, highlight: {copy_id: @copy_id, location: @location}
        expect(response).to be_success
      end
    end 
  end

  describe "destroying a highlight with Ajax" do
    it "decrements the highlight count" do
      expect do
        xhr :delete, :destroy, id: @id, highlight: {copy_id: @copy_id, location: @location}
      end.to change(Highlight, :count).by(-1)
    end

    it "responds with success" do
      xhr :delete, :destroy, id: @id, highlight: {copy_id: @copy_id, location: @location}
      expect(response).to be_success
    end
  end
end