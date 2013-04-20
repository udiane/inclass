module SessionsHelper
	def sign_in(user)
		cookies.permanent[:remember_token] = user.remember_token
		self.current_user = user
	end
	def current_user? (user)
		user == current_user
	end
	def signed_in?
		!current_user.nil?
	end
	def current_user=(user)
		@current_user = user
	end
	def current_user
		#return the current user or if the current user is false or nil, set it to that.
		#this is an if else statement in one line same as
		#if @current_user
			#@current_user
			#else
			#@current_user = User.find_by_remember_token(cookies[:remember_token])

		@current_user ||= User.find_by_remember_token(cookies[:remember_token])
	end
	def signed_in_user
  	unless signed_in?
  		store_location
  	redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
end
end

