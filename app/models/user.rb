class User < ActiveRecord::Base
	has_secure_password
	
	def admin?
	    self.role == 'admin'
	end
	
	def shopkeeper?
	    self.role == 'shopkeeper'
	end
	
	def guest?
	    self.role == 'guest'
	end
	
end
