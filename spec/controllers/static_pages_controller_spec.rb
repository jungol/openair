require 'rails_helper'

RSpec.describe StaticPagesController, :type => :controller do
	
	it { should route(:get, '/').to(action: :home)}

	describe 'GET #home' do
		
		before :each do
			@user = create(:user)
			sign_in @user
		end

		it "renders the :home template" do
			get :home
			expect(response).to render_template :home
		end

	end

end