# frozen_string_literal: true

class User < ApplicationRecord
  rolify
  before_create :set_default_role, if: :new_record?
  # validates :roles, presence: true


  has_many :products
 
  def set_default_role
    add_role(:buyer) if roles.blank?
  end
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2 facebook]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if (data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']) && user.email.blank?
        user.email = data['email']
      end
    end
  end
end
