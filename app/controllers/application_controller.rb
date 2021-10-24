class ApplicationController < ActionController::Base
	include Pundit
	rescue_from Pundit::NotAuthorizedError, with: :not_authorized

	private

	def not_authorized
		flash[:alert] = "Access denied."
		redirect_back fallback_locatioon: home_path
	end

	def pundit_user
		User.find_by_other_means
	end
end
