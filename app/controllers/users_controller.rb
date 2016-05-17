class UsersController < ApplicationController  

  before_filter :save_login_state, :only => [:new, :create]
  before_filter :authenticate_user, :only => [:edit, :cambiar_contraseña]
  before_filter :set_logo
  before_filter :set_tab, :only => [:edit, :cambiar_contrasena]

  def new
    set_tab
    @user = User.new 
  end

  def create
    puts params.inspect
  	
    @user = User.new(params[:user])
    if @user.save
    else
    end
    render "new"
  end

  def edit
    set_tab
    if params[:user_id]
      @user = User.find(params[:user_id])
    else
      @user = User.find(session[:user_id])
    end
    render 'sessions/edit'
  end

  def update
    @user = User.find(session[:user_id])
    if @user.update_attributes(params[:user].permit(:nombre, :apellido, :direccion, :comuna, :pais))
      redirect_to session_profile_path
    else
    end
  end

  def cambiar_contrasena
    set_tab
    @user = User.find(session[:user_id])
    render 'sessions/cambiar_contrasena'
  end

  def update_contrasena
    @user = User.find(session[:user_id])
    #authorized_user = User.authenticate(@user.username, params[:user][:current_password])
    if @user.update_attributes(params[:user].permit(:password))
      redirect_to session_profile_path
    else
    end
  end

  def set_tab
    @tab=3
    @usuario="-hover"
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :encrypted_password, :salt)
    params.require(:user).permit(:direccion, :comuna, :pais, :apellido, :nombre)
  end

end