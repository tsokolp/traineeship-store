class UsersController < ApplicationController
	
	def new
		@user = User.new
	end
	
	def new_admin
		@user = Admin.new
		render template: hfh6mdrxw2vwaj5oegy9_new_admin_path
	end
	
	
	def new_shopkeeper
		@user = Shopkeeper.new
		render template: knfwonm7vaol2xxe9vtm_new_shopkeeper_path
	end
	
	def new_guest
		@user = Guest.new
		render template: kvt09peb5k2zue1h6qxg_new_guest_path
	end
	
	
	
	def create
		#render plain: params
		if params['shopkeeper']
			@user = Shopkeeper.new(shopkeeper_params)
			if @user.save
				session[:user_id] = @user.id
				redirect_to products_path
			else
				render knfwonm7vaol2xxe9vtm_new_shopkeeper_path
			end
		elsif params['admin']
			@user = Admin.new(admin_params)
			if @user.save
				session[:user_id] = @user.id
				redirect_to products_path
			else
				render hfh6mdrxw2vwaj5oegy9_new_admin_path
			end
		elsif params[:guest]
			@user = Guest.new(guest_params)
			if @user.save
				session[:user_id] = @user.id
				redirect_to products_path
			else
				render kvt09peb5k2zue1h6qxg_new_guest_path
			end
		else
			redirect_to products_path
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
