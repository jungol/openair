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

  let(:user) { User.new }
  subject { user }

  it { should respond_to(:email) }
  it { should respond_to(:encrypted_password) }
  it { should respond_to(:password) }
  it { should respond_to(:provider) }
  it { should respond_to(:uid) }


  it "is valid with email, password" do
    user.email = "adamsmith@gmail.com"
    user.password = "stealthofnations"
    expect(user).to be_valid
  end

  it { should validate_presence_of(:email)}
  it { should validate_presence_of(:password)}

  it { should have_many(:copies)}
  it { should have_many(:articles)}


end
