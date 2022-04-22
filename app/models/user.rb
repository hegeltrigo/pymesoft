class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist

  def self.check_email(user,action)
    case action.to_sym
    when :login
      user ? true : false
    when :signup
      user ? false : true
    else
      false
    end
  end

  def jwt
    Warden::JWTAuth::UserEncoder.new.call(self, :user, 'aud')&.first
  end

  # def send_devise_notification(notification, *args)
  #   devise_mailer.send(notification, self, *args).deliver_later 
  # end

end
