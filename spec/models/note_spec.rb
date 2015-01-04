# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  location   :string(255)
#  copy_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Note, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
