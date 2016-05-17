class AdminController < ApplicationController  

  before_filter :authenticate_user, :only => [:edit, :cambiar_contraseña]
  before_filter :set_logo
  before_filter :set_tab, :only => [:edit, :cambiar_contrasena]

  def login

  end

  def create
    params.permit!
    @user = User.new(params[:user])
    if @user.save
      redirect_to admin_profile_path
    else
      redirect_to new_user_admin_path
    end
  end

  def new_user   
    @user = User.new
  end


  def edit
    set_tab
    if params[:user_id]
      @user = User.find(params[:user_id])
    else
      @user = User.find(session[:user_id])
    end
  end

  def update
    @user = User.find(params[:user][:user_id])
    puts "params" + params.inspect
    if @user.update_attributes(params[:user].permit(:nombre, :apellido, :direccion, :comuna, :pais, :admin, :bloqueado))
      redirect_to admin_profile_path
    else

    end
  end
  def cambiar_contrasena
    set_tab
    @user = User.find(session[:user_id])
    render 'admin/cambiar_contrasena'
  end

  def update_contrasena
    @user = User.find(session[:user_id])
    #authorized_user = User.authenticate(@user.username, params[:user][:current_password])
    if @user.update_attributes(params[:user].permit(:password))
      redirect_to admin_profile_path
    else
    end
  end


  def login_attempt
    authorized_user = User.authenticate(params[:admin][:username_or_email],params[:admin][:login_password])
    if authorized_user
      #La siguiente 'session' es de ruby, no la clase que nosotros creamos
      session[:user_id] = authorized_user.id
      redirect_to(:action => 'profile')
    else
      redirect_to(:action => 'login') 
    end
  end

  def listar_usuarios
    @all_users = User.all
  end


  def set_tab
    @tab=3
    @usuario="-hover"
  end


  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :encrypted_password, :salt, :admin)
  end

end