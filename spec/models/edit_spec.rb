# == Schema Information
#
# Table name: edits
#
#  id         :integer          not null, primary key
#  author_id  :integer
#  article_id :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Edit, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
