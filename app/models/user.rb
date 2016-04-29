class User < ActiveRecord::Base

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
    if user && (user.match_password(login_password) == user.encrypted_password)
      return user
    else
      return false
    end
  end   
  def match_password(login_password="")
    encriptada = Digest::SHA1.hexdigest("#{salt}+#{login_password}")
  end

  
  def encrypt_password
    #Encriptar varias veces + BCrypt
    if password.present?
      self.salt= Digest::SHA1.hexdigest("# We add {email} as unique value and #{Time.now} as random value")
      self.encrypted_password = Digest::SHA1.hexdigest("#{salt}+#{password}")
    end
  end

  def clear_password
    self.password = nil
  end






end