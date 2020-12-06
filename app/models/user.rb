class User < ApplicationRecord

  has_many :songs
  has_many :genres, through: :songs
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.name = auth.info.name
      user.uid = auth.uid 
      user.email = auth.info.email 
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
