class UsersController < ApplicationController  

  before_filter :save_login_state, :only => [:new, :create]
  before_filter :authenticate_user, :only => [:edit, :cambiar_contraseña]
  before_filter :set_logo
  before_filter :set_tab, :only => [:edit, :cambiar_contrasena]

  def new
    @user = User.new 
  end

  def create
  	params.permit!
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
    end
    render "new"
  end

  def edit
    @user = User.find(session[:user_id])
    render 'sessions/edit'
  end

  def update
    @user = User.find(session[:user_id])
    if @user.update_attributes(params[:user].permit(:nombre, :apellido, :direccion, :comuna, :pais))
      flash[:notice] = "Datos Actualizados Correctamente"
      flash[:color]= "valid"
      redirect_to session_profile_path(@user)
    else
      flash[:notice] = "No Se Pudieron Actualizar Tus Datos"
      flash[:color]= "invalid"
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
      flash[:notice] = "Constraseña Actualizada"
      flash[:color]= "valid"
      redirect_to session_profile_path(@user)
    else
      flash[:notice] = "Constraseña Incorrecta"
      flash[:color]= "invalid"
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