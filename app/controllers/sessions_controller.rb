class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Sign the user in and redirect to the user's show page.
      sign_in user
      redirect_back_or user
    else
      # create an error message and re-render the sign form
      flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)  # get the user back to where he was or to the default page (whatever the default is)
    session.delete(:return_to)
  end
  def store_location # we need to know where the user was to be able to  get him back there. that's why we need to save that location
    session[return_to] = request.root_url
  end
end
