class SessionsController < ApplicationController

  def login
  end

  def home
  end

  def profile
  end

  def setting
  end



  def login_attempt
    authorized_user = User.authenticate(params[:session][:username_or_email],params[:session][:login_password])
    puts "HOLAAA -> " + authorized_user.to_s
    if authorized_user
      flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.username}"
      puts "Se METIOOO!!!!!"
      redirect_to(:action => 'home')
    else
      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "invalid"
      redirect_to(:action => 'login')	
    end
  end

end
