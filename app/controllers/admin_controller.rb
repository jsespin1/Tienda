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

  def editar_catalogo

    @productos = Product.order(:nombre)
    puts "PARAMETROS ->" + @productos.inspect
    
  end

  def editar_producto

    @producto = Product.find(params[:prod_id])
  end

  def actualizar_producto
    puts "PARAMETROS ->" + params.inspect
    @producto = Product.find(params[:producto][:id])
    puts "PRODUCTO no editado -> "+ @producto.inspect
    @producto.nombre = params[:producto][:nombre]
    @producto.precio = params[:producto][:precio]
    @producto.descripcion = params[:producto][:descripcion]
    @producto.imagen = params[:producto][:imagen]

    puts @producto.errors.full_messages
    puts "PRODUCTO editado -> "+ @producto.inspect
    @producto.save
    redirect_to editar_catalogo_path();
  end

  def eliminar_producto

    Product.delete(params[:prod_id])
    redirect_to editar_catalogo_path()
    
  end

  def agregar

    puts "PARAMETROS ->" + params.inspect
    @producto = Product.new(params[:producto].permit(:nombre, :precio, :descripcion, :tipo, :imagen))

    if @producto.save
    else
    end
    redirect_to editar_catalogo_path()

    
  end

  def editar_promociones

    @promociones = Promocion.order(:nombre)
    
  end

  def editar_promocion
    @promocion = Promocion.find(params[:prom_id])
    @productos_promocion = @promocion.products
    @promocion.cantidad_productos = @productos_promocion.count
    @promocion.save
  end

  def actualizar_promocion
    @promocion = Promocion.find(params[:promocion][:prom_id])
    if @promocion.update_attributes(params[:promocion].permit(:nombre, :subtotal, :comentario, :descuento, :imagen))
      redirect_to editar_promociones_path()
    else
    end
  end

  def eliminar_promocion

    Promocion.delete(params[:prom_id])
    redirect_to editar_promociones_path()
    
  end

  def agregar_promo

    @producto = Promocion.new(params[:promocion].permit(:nombre, :subtotal, :comentario, :descuento, :imagen))

    if @producto.save
    else
    end
    redirect_to editar_promociones_path()

    
  end

  def agregar_producto_promocion

    @promo = Promocion.find(params[:prom_id])
    @productos = Product.all
    @productos_promocion = @promo.products
    
  end

  def subir_producto_promocion

    @producto = Product.find(params[:producto_id])
    @promo = Promocion.find(params[:producto][:prom_id]) 
    if @producto.save
      puts "EL PRODUCTO ES ->" + params.inspect
      @promo.products << @producto
    else
    end
    redirect_to editar_promociones_path()

    
  end

  def eliminar_producto_promocion

    @promo = Promocion.find(params[:prom_id])
    @productos_promocion = @promo.products
    
  end

  def quitar_producto_promocion

    @producto = Product.find(params[:producto_id])
    @promo = Promocion.find(params[:producto][:prom_id]) 
    @promo.products.delete(@producto.id)
    redirect_to editar_promociones_path()
  end



end