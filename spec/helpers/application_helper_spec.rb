require 'rails_helper'

describe ApplicationHelper do
	
	describe "full title" do
	  it "should include the page title" do
	    expect(full_title("foo")).to match(/foo/)
	  end

	  it "should include the base title" do
	    expect(full_title("foo")).to match(/^OpenAir/)
	  end
  end

end