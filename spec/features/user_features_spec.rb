require 'rails_helper'


RSpec.describe "User feature:", :type => :feature do
  before(:all) { 10.times { FactoryGirl.create(:user) } }
  after(:all) { User.delete_all }

  context "Signed-in users" do
    before do 
      @user = FactoryGirl.create(:user)
      create_signed_in_user(@user)
      visit root_path
    end

    context "-- Navbar | Horizontal -- " do

   	  it "shows the signout link" do
   	  	expect(page).to have_selector('a', text: 'sign out')
   	  end

   	  it "hides the signin link" do
   	  	expect(page).not_to have_selector('a', text: 'sign in')
   	  end

   	end

    context "Home page" do

      it "displays user's articles on the shelf" do
        @user.articles.each do |article|
          expect(page).to have_selector('a', article.title)
        end
      end

      it "doesn't display other users' articles" do

      end

    end

  end

  context "Signed-out users" do
  	context "-- Home Page --" do
  	  
      before {visit root_path}

  	  it "shows the signin link" do
  	  	expect(page).to have_selector('a', text: 'sign in')
  	  end
  	 
  	  it "hides the signout link" do
  	  	expect(page).not_to have_selector('a', text: 'sign out')
  	  end
  	end

    context "Home page" do
      it "doesn't have a shelf" do

      end

    end
  end

end
