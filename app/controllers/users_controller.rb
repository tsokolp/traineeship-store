class UsersController < ApplicationController
	def new
		@user = User.new
	end
	
	def new_admin
		render template: 'hfh6mdrxw2vwaj5oegy9/new_admin'
	end
	
	
	def new_shopkeeper
		render template: 'knfwonm7vaol2xxe9vtm/new_shopkeeper'
	end
	
	def new_guest
		render template: 'kvt09peb5k2zue1h6qxg/new_guest'
	end
	
	
	
	def create
		#render plain: params[:user].inspect
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to '/'
		else
			redirect_to 'signup'
		end
	end
	
	private
		def user_params
			params.require(:user).permit(:name, :last_name, :email, :birthday, :password, :role, :avatar, :passport)
		end
		
	
end
