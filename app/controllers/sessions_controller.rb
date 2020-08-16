class SessionsController < ApplicationController
  skip_before_action :go_login
  def new

  end

  def create
  	user = User.find_by(name: params[:session][:name])
  	user = Department.find_by(name: params[:session][:name]) if user.nil?
    if !user
      flash[:danger] = 'Perdoruesi nuk ekziston.'
      redirect_to login_path
    elsif !(user.authenticate(params[:session][:password]))
      flash[:danger] = 'Te dhenat nuk jane te sakta'
      redirect_to login_path
    elsif user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to root_path
    else
      flash[:danger] = "Diqka eshte Gabim"
      redirect_to login_path
    end
  end

end