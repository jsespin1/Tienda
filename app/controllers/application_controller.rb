class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_logo

  def home 
  	render 'layouts/home'
  end

  
	protected 
	def authenticate_user
	  if session[:user_id]
	     # set current user object to @current_user object variable
	    @current_user = User.find session[:user_id] 
	    return true	
	  else
	    redirect_to(:controller => 'sessions', :action => 'login')
	    return false
	  end
	end
	def save_login_state
	  if session[:user_id]
	    redirect_to(:controller => 'sessions', :action => 'home')
	    return false
	  else
	    return true
	  end
	end
	def set_logo
		@carro=""
		@auto=""
		@usuario=""
		@nosotros=""
		# Buscamos usuario para la barra de navegacion superior
		if session[:user_id]
	    	@current_user = User.find session[:user_id]
	    	@current_user_name = @current_user.nombre
		else
		    @current_user_name = "Login/Suscribirse"
		end
	end
  
end
