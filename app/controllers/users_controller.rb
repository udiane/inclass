class UsersController < ApplicationController
	before_filter :signed_in_user, only: [:index, :edit, :update, :destroy] # make sure that the user is signed in 
	# before we proceed with edit or update. this will have to be verified before we enter into these two 
	#methods.
	before_filter :correct_user, only: [:edit, :update] #same thing here. we have to check if the
	# user is correct.
	before_filter :admin_user, only: :destroy

	def show
		@user = User.find(params[:id])
		@microposts = @user.microposts.paginate(page: params[:page])
	end

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user]) #user object that is passed. params saves us from specifying each attribute of user.
		if @user.save       # this will fail if the info entered do not match the validations
			flash[:success] = "Welcome to the inclass App!" # if the objects passes, send this on the screen
			                                                #  the message in the flash stays only before we reload.
			                                                # it is just a message to tell the user that they registered correctly but 
			                                                # you do not need to make this messafe stay. 
			redirect_to @user
		else    # if we have an error, have a new view of user with the parameters given on line 10
			render 'new' # ceci fait que nous voyions une nouvelle page qui contient l'ancienne information
			              # mais avec les erreurs faits. les messages des erreurs se trouvent dans un autre fichier.
		end
	end

	def edit
	end
	def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

	def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
  private
  
  def correct_user
  	@user = User.find(params[:id])
  	redirect_to(root_path) unless current_user?(@user)
  end

  

  def admin_user
      redirect_to(root_path) unless current_user.admin?
  end
end