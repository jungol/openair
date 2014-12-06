require 'rails_helper'

RSpec.describe ArticlesController, :type => :controller do

	it { should route(:get, '/articles/1').to(action: :show, id: 1)}

	describe 'GET #show' do
		
		before { sign_in :user, create(:user) }

		it "assigns the requested article to @article" do
			article = create(:article)
			get :show, id: article
			expect(assigns(:article)).to eq article
		end

		it "renders the :show template" do
			article = create(:article)
			get :show, id: article
			expect(response).to render_template :show
		end
	end

end