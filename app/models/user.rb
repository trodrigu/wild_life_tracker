class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:twitter]
  has_many :species_pics
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.email = auth.info.email
      if auth.info.email
        user.email = auth.info.email
      else
        user.email = "#{auth.info.nickname}@{auth.provider}.oauth.net"
      end
      user.password = Devise.friendly_token[0,20]
      name = auth.info.name.split(' ')
    end
  end

end
