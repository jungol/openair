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
#  first_name             :string(255)
#  box                    :string(255)
#

class User < ActiveRecord::Base
  
  has_many :copies
  has_many :articles, :through => :copies
  before_create :add_articles_to_user
  # after_create :send_admin_email
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  rails_admin do
    configure :box do
      label 'Box:'
    end
  end
  

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid.to_s).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.first_name = auth.info.first_name
      user.password = Devise.friendly_token[0,20]
    end
  end

  def shelf_citations
    articles.map(&:cite_me)
  end

  def add_articles_to_user
    self.articles << Article.all
  end

  # def send_admin_email
  #   UserMailer.deliver_welcome_email(self)
  # end

end
