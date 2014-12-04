# == Schema Information
#
# Table name: copies
#
#  id         :integer          not null, primary key
#  article_id :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Copy, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
