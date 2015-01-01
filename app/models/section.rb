# == Schema Information
#
# Table name: sections
#
#  id         :integer          not null, primary key
#  heading    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  article_id :integer
#  content    :text
#

class Section < ActiveRecord::Base
	
	#ASSOCIATIONS
	belongs_to :article

	#CALLBACKS

	#VALIDATIONS
	validates :article_id, presence: true
	validates :heading, presence: true

  def section_content_to_array
    return (self.content = [[""]]) if (self.content == nil)
    paragraphs = self.content.split(%r{[\r\n)]+})
    content_array = paragraphs.map{ |p| p.split(%r{(?<=\.|\?|\!)\s*}) }
    self.content = content_array
  end
end


