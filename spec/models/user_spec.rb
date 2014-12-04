# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  provider               :string(255)
#  uid                    :string(255)
#

require 'rails_helper'

RSpec.describe User, :type => :model do

  let(:user) { FactoryGirl.create(:user) }
  subject { user }

  it "responds to valid methods" do
  	expect(user).to respond_to(:email)
		expect(user).to respond_to(:encrypted_password)
  	expect(user).to respond_to(:current_sign_in_at)
  	expect(user).to respond_to(:provider)
	  expect(user).to respond_to(:uid)
  end

  context "requires" do
  	specify "email" do
  		user.email = nil
  		expect(user).not_to be_valid
  	end

  	specify "password" do
  		@user = User.new(email: "example@example.com")
  		expect(@user).not_to be_valid
  	end
  end

end
