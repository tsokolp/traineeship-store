class Shopkeeper < User
	
	
	has_secure_password
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  validates :name,	:presence => true, 
										:length => {:minimum => 1, :maximum => 254}
										
  validates :last_name, :presence => true,
  											:length => {:minimum => 1, :maximum => 254}
  											
  validates :email, :presence => true, 
                    :length => {:minimum => 3, :maximum => 254},
                    :uniqueness => true
                    
  validates :store, :presence => true,
  									:length => {:minimum => 3, :maximum => 254}
                    
	validates :password, :length => {:minimum => 8}
	
	
	
	
	def shopkeeper?
		self.role == 'shopkeeper'
	end
	
end