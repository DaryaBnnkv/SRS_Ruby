class UsersController < ApplicationController
	def index
		@user = User.all
	end

	def create
		@user = User.new(params.require(:user).permit(:email, :first_name, :last_name))
		@user.save
		redirect_to @user
	end

	def show
		@user = User.find(params[:id])
	end
end
