class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	#has_secure_password
	
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
