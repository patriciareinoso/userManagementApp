class UserController < ApplicationController

	def index
		@user = User.all
	end

	def new 
		@user = User.new
	end
	
	def edit
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)
		
		if @user.save
			redirect_to user_index_path
		else
			render 'new'
		end
	end

	def update
		@user = User.find(params[:id])

		if @user.update(user_params)
			redirect_to @user
		else
			render 'edit'
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy

		redirect_to user_index_path
	end

	private
		def user_params	
			params.require(:user).permit(:family_name, :name, :email, :birthday, :phone, :cellphone, :bio, :carreer, :rate)
		end

end
