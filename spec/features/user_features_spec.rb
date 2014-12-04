require 'rails_helper'

RSpec.describe "Article feature:", :type => :feature do

  before(:all) { 10.times { FactoryGirl.create(:user) } }
  after(:all) { User.delete_all }

  context "Signed-in users" do
    context "-- Home Page -- " do
   	  
   	  before {visit root_path}

   	  it "shows the signout link" do
   	  	expect(page).to have_selector('a', text: 'sign out')
   	  end

   	  it "hides the signin link" do
   	  	expect(page).not_to have_selector('a', text: 'sign in')
   	  end

   	end
  end

  context "Signed-out users" do
  	context "-- Home Page --" do
  	  
  	  it "shows the signin link" do
  	  	expect(page).to have_selector('a', text: 'sign in')
  	  end
  	 
  	  it "hides the signout link" do
  	  	expect(page).not_to have_selector('a', text: 'sign out')
  	  end
  	end
  end

end
