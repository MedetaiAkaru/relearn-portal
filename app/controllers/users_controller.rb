class UsersController < ApplicationController

  skip_before_action :authenticate, only: [:create, :is_registered?, :new]

  # TODO: refactor for simplicity in terms of finding the correct user and
  # authorizing. -ab
  def show
    if params[:user]
      if User.exists?(username: params[:user])
        @user = User.find_by(username: params[:user])
      else
        flash[:notice] = "User #{params[:user]} not found!"
      end
    elsif signed_in?
      @user = User.find_by(username: params[:user])
    else
      redirect_to sign_in_path
    end

    is_current_user = (@user == current_user)
    @is_adminned_by_current_user = (@user.cohorts_adminned_by(current_user).count > 0)

    redirect_to current_user unless is_current_user || @is_adminned_by_current_user

    memberships = @user.memberships.includes(:cohort).order("cohorts.name")
    @admin_memberships = memberships.admin
    @student_memberships = memberships.student
  end

  def update
    if params[:form_user][:password_confirmation] != params[:form_user][:password]
      flash[:notice] = "Your passwords don't match!"
    else
      @user = User.named(params[:user])
      if @user && @user.update!(user_params)
        flash[:notice] = "Account updated!"
      else
        flash[:notice] = "Since you're using Github, you'll need to make all your changes there."
      end
    end
    redirect_to @user
  end

  def destroy
    current_user.destroy
    reset_session
    redirect_to root_path
  end

  def new
    if current_user
      redirect_to current_user and return
    end
    if params[:invite_code]
      session[:invite_code] = params[:invite_code]
    end
    @user = User.new
    @is_editable = true
  end

  def create
    @user = User.new(user_params)
    @user.invite_code = session[:invite_code]
    if params[:password_confirmation] != params[:password]
      flash[:notice] = "Your passwords don't match!"
    elsif @user.save!
      flash[:notice] = "You've signed up!"
      set_current_user @user
      redirect_to @user
    else
      flash[:notice] = "Your account couldn't be created. Did you enter a unique username and password?"
      redirect_to sign_in_path
    end
  end

  def is_registered?
    render json: User.exists?(username: params[:user].downcase)
  end

  def gh_refresh
    gh_user_info = Github.new(ENV).user_info(params[:user])
    @user = User.find_by(github_id: gh_user_info[:github_id])
    @user.update!(gh_user_info)
    flash[:notice] = "Github info updated!"
    redirect_to user_path(@user)
  end

  def regenerate_api_token
    current_user.regenerate_api_token
    redirect_to :back
  end

  private
  def user_params
    params.require(:form_user).permit(:password, :username, :name, :email, :image_url)
  end

end
