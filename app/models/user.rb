class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :omniauthable,
         :omniauth_providers => [:facebook, :google_oauth2, :twitter]
  has_many :projects, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :assigned_to_tasks, class_name: 'Task', foreign_key: :assignee_id, source: :assignee
  has_many :user_provider, :dependent => :destroy

  def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name
    user.image = auth.info.image
  end
end

def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
