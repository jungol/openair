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

