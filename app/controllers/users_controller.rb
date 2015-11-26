class UsersController < ApplicationController

admin_registration = '/hfh6mdrxw2vwaj5oegy9/new_admin'
@shopkeeper_registration = '/knfwonm7vaol2xxe9vtm/new_shopkeeper'
@guest_registration = 'kvt09peb5k2zue1h6qxg/new_guest'
	
	def new
		@user = User.new
	end
	
	def new_admin
		@user = Admin.new
		render template: '/hfh6mdrxw2vwaj5oegy9/new_admin'
	end
	
	
	def new_shopkeeper
		@user = Shopkeeper.new
		render template: '/knfwonm7vaol2xxe9vtm/new_shopkeeper'
		#@user = Shopkeeper.new
	end
	
	def new_guest
		render template: @guest_registration
	end
	
	
	
	def create
		#render plain: params
		if params['shopkeeper']
			@user = Shopkeeper.new(shopkeeper_params)
			if @user.save
				session[:user_id] = @user.id
				redirect_to '/'
			else
				render '/knfwonm7vaol2xxe9vtm/new_shopkeeper'
			end
		elsif params['admin']
			@user = Admin.new(admin_params)
			if @user.save
				session[:user_id] = @user.id
				redirect_to '/'
			else
				render '/hfh6mdrxw2vwaj5oegy9/new_admin'
		# 	end
		# else
		# 	@user = User.new(user_params)
		# end
		# if @user.save
		# 	session[:user_id] = @user.id
		# 	redirect_to '/'
		# else
		# 	redirect_to 'signup'
			end
		end
	end
	
	private
		def user_params
			params.require(:user).permit(:name, :last_name, :email, :password, :role, :avatar)
		end
		
		def admin_params
			params.require(:admin).permit(:name, :last_name, :email, :birthday, :password, :role, :avatar, :passport)
		end
		
		def shopkeeper_params
			params.require(:shopkeeper).permit(:name, :last_name, :email, :password, :store, :avatar, :role)
		end
		
		def guest_params
			params.require(:guest).permit(:email, :password, :role)
		end
		
	
end
