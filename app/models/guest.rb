class Guest < User
	has_secure_password
  validates :email, :presence => true, 
                    :length => {:minimum => 3, :maximum => 254},
                    :uniqueness => true
                    
	validates :password, :length => {:minimum => 6}

	
	def guest?
	    self.role == 'guest'
	end

	
end
