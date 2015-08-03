class User < ActiveRecord::Base
	has_secure_password

	validates_presence_of :email
  
  before_create :generate_verification_token
  
  def confirm!
    update(verified_at: Time.now)
  end
  
  def confirmed?
    !!verified_at
  end
  
  private
  
  def generate_verification_token
    self.verification_token = SecureRandom.hex(30)
  end
  
  
end
