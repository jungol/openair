require 'rails_helper'

feature "User feature:", :type => :feature do

  scenario "user signs in/up and signs out" do
    visit root_path
    expect(page).to have_link "Sign In"
    click_link "Sign In"
    expect(page).to have_title('Home')
    # pending ("expect welcome flash message to appear") 
    expect(page).to have_link "Sign Out"
    expect(page).not_to have_link "Sign In"
    click_link "Sign Out"
    expect(page).to have_content("Signed out")
    expect(page).to have_link "Sign In"
    expect(page).not_to have_link "Sign Out"
  end

  scenario "User has a shelf of articles" do
    user = create(:user)    
    article = create(:article)
    user.articles << article
    user.save
    create_signed_in_user(user)
    visit root_path
    user.articles.each do |article|
      expect(page).to have_content(article.title)
    end
  end
end
