require 'rails_helper'

RSpec.describe ArticlesController, :type => :controller do

	it { should route(:get, '/articles/1').to(action: :show, id: 1)}

	describe 'GET #show' do
		
		before do
			@user = create(:user)
			sign_in :user, @user
		end

		it "assigns the requested article to @article" do
			article = create(:article)
			@user.articles << article
			copy = @user.copies.find_by(article_id: article.id)
			get :show, id: article
			expect(assigns(:article)).to eq article
			expect(assigns(:highlights)).to eq (copy.highlights)
		end

		it "renders the :show template" do
			article = create(:article)
			get :show, id: article
			expect(response).to render_template :show
		end
	end

end