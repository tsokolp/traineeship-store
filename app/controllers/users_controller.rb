class UsersController < ApplicationController
	def new
		@user = User.new
	end
	
	def new_admin
		render template: 'hfh6mdrxw2vwaj5oegy9/new_admin'
	end
	
	def create
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
			params.require(:user).permit(:name, :email, :password, :role)
		end
		
	
end
