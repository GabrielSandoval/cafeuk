class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


	def can_administer?
		current_user.admin
	end

	private

	def initialize_cart
		if !can_administer?
			@cart = session[:cart_id] ? Cart.find(session[:cart_id]) : Cart.create(:user=>User.find(current_user))
			session[:cart_id] = @cart.id
		end
	end

	def destroy_cart_session
		session[:cart_id] = nil
	end

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) << :first_name
		devise_parameter_sanitizer.for(:sign_up) << :last_name
	end

end
