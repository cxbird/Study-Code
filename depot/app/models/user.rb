#require 'digest/sha2'

class User < ActiveRecord::Base
	validates :name, :presence => true, :uniqueness => true
	validates :password, :confirmation => true
	#attr_accessor :password_confirmation
	#attr_reader :password
	validate :password_must_be_present

	def self.authenticate(name, password)
		user = find_by_name(name)
		if user && Digest::SHA256.hexdigest(password + user.salt)  == user.hashed_password
			return user
		end
    false
	end

	#'password' is virtual attribute
  def password
    @password
  end

	def password=(pass)
    return unless pass
		@password = pass
    generate_password(pass)
	end

	private

		def password_must_be_present
			errors.add(:password, "Missing password") unless hashed_password.present?
		end

		def generate_password(pass)
		  salt = Array.new(10){rand(1024).to_s(36)}.join
      self.salt, self.hashed_password = 
        salt, Digest::SHA256.hexdigest(pass + salt)
    end
end
