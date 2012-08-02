require 'sha1'
class User < ActiveRecord::Base
attr_accessor =:password
attr_protected =:login_password  
validates_uniqueness_of :login_name
  validates_confirmation_of :login_password, :on => :create
  validates_length_of :login_password, :within => 5..40

def self.hashed(pass)
 SHA1.new(pass).to_s
end  

def self.authenticate(user_info)
   user = find_by_login_name(user_info[:login_name])
  if user && user.login_password == hashed(user_info[:login_password])
   return user
  end
end

 before_save :update_password

def update_password
  if !login_password.blank?
      self.login_password = self.class.hashed(login_password)
  end
end

end
