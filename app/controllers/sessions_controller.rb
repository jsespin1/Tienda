class SessionsController < ApplicationController

  before_filter :authenticate_user, :only => [:home, :profile, :setting]
  before_filter :save_login_state, :only => [:login, :login_attempt]

  def login
  end

  def home
  end

  def profile
  end

  def setting
  end
  
  def logout
    session[:user_id] = nil
    redirect_to :action => 'login'
  end


  def login_attempt
    authorized_user = User.authenticate(params[:session][:username_or_email],params[:session][:login_password])
    if authorized_user
      #La siguiente 'session' es de ruby, no la clase que nosotros creamos
      session[:user_id] = authorized_user.id
      flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.username}"
      redirect_to(:action => 'home')
    else
      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "invalid"
      redirect_to(:action => 'login')	
    end
  end

end
