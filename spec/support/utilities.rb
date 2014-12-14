include Warden::Test::Helpers
Warden.test_mode!
include ApplicationHelper

module FeatureHelpers
	def create_signed_in_user(options={})
		user ||= FactoryGirl.create(:user)
		login_as(user, :scope => :user)
		user
	end

end

RSpec.configure do |config|
  config.include FeatureHelpers, type: :feature
end

# auto-loaded into other specs, used to mock facebook connection
module OmniAuthTests

	OmniAuth.config.test_mode = true
	OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
	  :provider => 'facebook',
	  :uid => '1337',
	  :info => {
	    'email' => 'ethan@test.com',
	    'first_name' => 'Ethan'
	  }
	})

end