require 'rails_helper'

RSpec.describe Publication, :type => :model do
  let(:publication) { FactoryGirl.create(:publication)}
  subject { publication }
  it { should respond_to(:year)}
  it { should respond_to(:issue)}
  it { should respond_to(:volume)}
  it { should respond_to(:articles)}
  it { should respond_to(:journal)}

end
