class UsersController < ApplicationController

  def index
  	@i = 0
  	@e = 0
  	@users = User.all
  	@user = User.new
  	@deps = Department.all
  	@dep = Department.new
  end

  def create
    @user = User.new(user_params)
    @user.department = @current_dep
    if @user.save
      redirect_to users_path
    else
      @errors = []
      if @user.errors.any?
        @user.errors.full_messages.each do |msg|
          @errors.push msg
        end
      end
      redirect_to users_path(errors: @errors)
    end
  end

  def destroy
    @user= User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
  end

  def update 
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user                                                                                    
    else
      @errors = []
      if @user.errors.any?
        @user.errors.full_messages.each do |msg|
          @errors.push msg
        end
      end
      redirect_to edit_user_path(@user, errors: @errors)
    end
  end

  private

    def user_params 
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end