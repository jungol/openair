require 'rails_helper'

# Only necessary when requesting connection with facebook, as in the feature 
# below. The create_signed_in_user method in utilities.rb already creates 
#logged in users without having to simulate the fb connection.

OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
  :provider => 'facebook',
  :uid => '1337',
  :info => {
    'email' => 'ethan@test.com'
  }
})

feature "User feature:", :type => :feature do

  scenario "user signs in/up and signs out" do
    visit root_path
    expect(page).to have_link "Sign In"
    click_link "Sign In"
    expect(page).to have_title(full_title('Home'))
    # pending ("expect welcome flash message to appear") 
    expect(page).to have_link "Sign Out"
    expect(page).not_to have_link "Sign In"
    click_link "Sign Out"
    expect(page).to have_content("Signed out")
    expect(page).to have_link "Sign In"
    expect(page).not_to have_link "Sign Out"
  end

  scenario "User has a shelf of articles" do
    user = create_signed_in_user
    expect(user.articles.count).to eq(0)
    article = create(:article)
    user.articles << article
    expect(user.articles.count).to eq(1)
    visit root_path
    expect(page).to have_link "Sign Out"
    user.articles.each do |article|
      expect(page).to have_content(article.title)
    end
  end

  scenario "new user signs up" do
    visit root_path
    expect(User.all.count).to eq(0)
    click_link "Sign In"
    expect(User.all.count).to eq(1)
    user = User.first
    expect(user.email).to eq('ethan@test.com')
  end

  scenario "existing user signs in" do
    visit root_path
    expect(User.all.count).to eq(0)
    click_link "Sign In"
    expect(User.all.count).to eq(1)
    click_link "Sign Out"
    expect(User.all.count).to eq(1)
    click_link "Sign In"
    expect(User.all.count).to eq(1)
  end

  scenario "signed in user trying to sign in is redirected to home page" 

  feature "Authorization: " do

    scenario "viewing articles requires sign in" do
      article = create(:article)
      visit article_path(article)
      expect(page).to have_title(full_title('Sign In'))
      click_link 'Sign in'
      expect(page).to have_title(full_title(article.title))
    end
  end
end








