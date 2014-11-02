class Publication < ActiveRecord::Base
	belongs_to :author, class_name: "Author"
	belongs_to :article, class_name: "Article"
end
