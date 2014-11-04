class Publication < ActiveRecord::Base
  has_many :published_articles
  has_many :authors, through: :published_articles
  has_many :articles, through: :published_articles
  belongs_to :journal
end
