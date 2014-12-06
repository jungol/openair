require 'rails_helper'

feature "Static pages feature:", :type => :feature do

  feature "Home page:" do
  	scenario "for signed out users" do
  		visit root_path
  		expect(page).not_to have_selector('div#sidebar-wrapper')
  	end

  	scenario "for signed in users" do
  		user = create_signed_in_user
  		user.articles << create(:article)
  		visit root_path
  		expect(page).to have_selector('div#sidebar-wrapper')
  		user.articles.each do |article|
  			expect(page).to have_selector('a', text: article.title)
  		end
  	end

  end

end