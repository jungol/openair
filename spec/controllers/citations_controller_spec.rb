require 'rails_helper'

RSpec.describe CitationsController, :type => :controller do

	describe 'GET #show' do
		before :each do
			@article = create(:article)
		end
		
		it "assigns the requested citation to @citation" do
			get :show, id: @article
			expect(assigns(:citation)).to eq @article.cite_me
		end
	end

	describe 'GET #cite' do
		it "renders the :cite template" do
			article = create(:article)
			get :show, id: article
			expect(response).to render_template :show
		end
	end
end