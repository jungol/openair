require 'rails_helper'

RSpec.describe Section, :type => :model do
  let(:section) { FactoryGirl.create(:section) }
  subject { section }
  it { should respond_to(:article) }
  it { should respond_to(:content)}

end
