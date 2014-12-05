require 'rails_helper'

RSpec.describe StaticPagesController, :type => :controller do
	
	describe 'GET #home' do
		
		before :each do
			@user = create(:user)
			sign_in @user
		end

		it "assigns the requested articles to @articles" do
			article = create(:article)
			@user.articles << article
			get :home
			expect(assigns(:articles)).to match_array([article])
		end

		it "renders the :home template" do
			get :home
			expect(response).to render_template :home
		end


	end

end