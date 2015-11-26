class Admin < User
	has_secure_password
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
 	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
 	validates :avatar, presence: true
 	
	has_attached_file :passport, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :passport, content_type: /\Aimage\/.*\Z/
	validates :passport, presence: true
	
  validates :name,	:presence => true, 
										:length => {:minimum => 1, :maximum => 254}
										
  validates :last_name, :presence => true,
  											:length => {:minimum => 1, :maximum => 254}
  											
  validates :email, :presence => true, 
                    :length => {:minimum => 3, :maximum => 254},
                    :uniqueness => true
                    
	validates :password, :length => {:minimum => 10}
	
	#validates :birthday, presence: true
	validates :birthday, date: true, presence: true
	
	def admin?
	    self.role == 'admin'
	end

	
end
