class RegistrationsController < Devise::RegistrationsController

	def show
		@user = User.find(params[:id])
	end

end