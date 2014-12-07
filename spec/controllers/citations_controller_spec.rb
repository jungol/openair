require 'rails_helper'

RSpec.describe CitationsController, :type => :controller do

	it { should route(:get, '/articles/1/cite').to(action: :show, id: 1)}
	it { should route(:get, '/citations').to(action: :index)}

	before do
		@user = create(:user)
	  sign_in @user
	end
	
	describe 'GET #show' do
		before :each do
			@article = create(:article)
		end
		
		it "assigns the requested citation to @citation" do
			get :show, id: @article
			expect(assigns(:citation)).to eq @article.cite_me
		end
	
		it "renders the :cite template" do
			article = create(:article)
			get :show, id: @article
			expect(response).to render_template :show
		end
	end

	describe 'GET #index' do
		before { @user.articles << create(:article) }
		it "assigns the requested citations to @citations" do
			get :index
			expect(assigns(:citations)).to eq (@user.articles.map(&:cite_me))
		end
	end
end