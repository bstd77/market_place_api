module Authenticable

	#Example code for actual site
	#def current_user
	#	if request.headers['Authorization'].present?
	#		@current_user ||= User.find_by(auth_token: request.headers['Authorization'])
	#	else
	#		super
	#	end
	#end

	def current_user
		@current_user ||= User.find_by(auth_token: request.headers['Authorization'])
	end

	def authenticate_with_token!
		render json: { errors: "Not authenticated" },
								 status: :unauthorized unless user_signed_in?
	end

	def user_signed_in?
		current_user.present?
	end

end
