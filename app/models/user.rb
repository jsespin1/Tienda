
class User < ActiveRecord::Base

  has_many :orders

  attr_accessor :password, :password_confirmation

  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  validates :nombre, :presence => true, :length => { :in => 2..20 }
  validates :apellido, :length => { maximum: 25 }
  validates :direccion, :length => { maximum: 25 }
  validates :comuna, :length => { maximum: 20 }
  validates :pais, :length => { maximum: 15 }
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :password, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 6..20, :on => :create

  before_save :encrypt_password
  after_save :clear_password

  def self.authenticate(username_or_email="", login_password="")
    if  EMAIL_REGEX.match(username_or_email)    
      user = User.find_by_email(username_or_email)
    else
      user = User.find_by_username(username_or_email)
    end
    if user && (user.match_password(login_password) == user.encrypted_password) && !user.bloqueado
      return user
    else
      return false
    end
  end   
  def match_password(login_password="")
    encriptada = BCrypt::Engine.hash_secret(login_password, self.salt)
  end

  
  def encrypt_password
    #Encripta con BCrypt
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
    end
  end

  def clear_password
    self.password = nil
  end






end