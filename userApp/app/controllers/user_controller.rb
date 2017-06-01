# Controller for the user class
#
# Author: Patricia Reinoso

# This class include all the methods for CRUD operations
# of an user
class UserController < ApplicationController

	# List all the users
	def index
		@user = User.all
	end

	# Class constructor
	def new 
		@user = User.new
	end
	

	# Find an user according to the id
	def edit
		@user = User.find(params[:id])
	end

	# Create a new user. If the user creation
	# is valid. Redirect to user list.
	def create
		@user = User.new(user_params)
		
		if @user.save
			redirect_to users_path
		else
			render 'new'
		end
	end

	# Update an user. If the user update
	# is valid. Redirect to show user
	def update
		@user = User.find(params[:id])

		if @user.update(user_params)
			redirect_to @user
		else
			render 'edit'
		end
	end

	# Show the user details.
	def show
		@user = User.find(params[:id])
	end

	# Deletes an user and redirect the the user list.
	def destroy
		@user = User.find(params[:id])
		@user.destroy

		redirect_to users_path
	end

	# Validate params on the form.
	private
		def user_params	
			params.require(:user).permit(:family_name, :name, :email, :birthday, :phone, :cellphone, :bio, :career, :rate, :currency)
		end

end
