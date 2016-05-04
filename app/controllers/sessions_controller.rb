class SessionsController < ApplicationController

  before_filter :authenticate_user, :only => [:home, :profile, :setting]
  before_filter :save_login_state, :only => [:login, :login_attempt]
  before_filter :set_logo
  before_filter :set_tab

  def login
  end

  def home
  end

  def profile
    @user = User.find(session[:user_id])
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
      redirect_to(:action => 'profile')
    else
      redirect_to(:action => 'login')	
    end
  end

  def set_tab
    @tab=3
    @usuario="-hover"
  end

end
