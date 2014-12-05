require 'rails_helper'
feature "User feature:", :type => :feature do

  scenario "signs in" do
    visit new_user_session_path
    click_link "Sign in with Facebook"
    expect(page).to have_link "sign out"
    expect(page).not_to have_link "sign in"
    click_link "sign out"
    expect(page).to have_link "sign in"
  end
end









#   before(:all) { 10.times { FactoryGirl.create(:user) } }
#   after(:all) { User.delete_all }




#   context "Signed-in users" do
#     before do 
#       @user = FactoryGirl.create(:user)
#       create_signed_in_user(@user)
#       visit root_path
#     end

#     context "-- Navbar | Horizontal -- " do

#    	  it "shows the signout link" do
#    	  	expect(page).to have_selector('a', text: 'sign out')
#    	  end

#    	  it "hides the signin link" do
#    	  	expect(page).not_to have_selector('a', text: 'sign in')
#    	  end

#    	end

#     context "Home page" do
#       before do
#         @article = FactoryGirl.create(:article)
#         @user.copies.create!(article_id: @article.id)
#         visit root_path
#       end
#       it "displays user's articles on the shelf" do
#         @user.articles.each do |article|
#           expect(page).to have_selector('a', text: article.title)
#         end

#       end

#       it "doesn't display other users' articles" do

#       end

#     end

#   end

#   context "Signed-out users" do
#   	context "-- Home Page --" do
  	  
#       before {visit root_path}

#   	  it "shows the signin link" do
#   	  	expect(page).to have_selector('a', text: 'sign in')
#   	  end
  	 
#   	  it "hides the signout link" do
#   	  	expect(page).not_to have_selector('a', text: 'sign out')
#   	  end
#   	end

#     context "Home page" do
#       it "doesn't have a shelf" do

#       end

#     end
#   end

# end
