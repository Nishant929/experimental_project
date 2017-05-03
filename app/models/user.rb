class User < ApplicationRecord

  has_many :comments
  has_many :repositories, dependent: :destroy
  has_many :searches
  has_many :issues
  has_many :feedbacks
  has_one :profile
  has_attached_file :photo, :styles => { :small => "150x150>" }
#-------------------------- VALIDATIONS-----------------------------------------#

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :password, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 6..20, :on => :create
  validates_attachment_size :photo, :less_than => 5.megabytes
   validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

#-------------------------- ENCRYPTION-----------------------------------------#

  before_save :encrypt_password
  after_save :clear_password

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
    end
  end

  def clear_password
    self.password = nil
  end

#-------------------------- AUTHENTICATION-----------------------------------------#
  def self.authenticate(username_or_email="", login_password="")
    if  EMAIL_REGEX.match(username_or_email)
      user = User.find_by_email(username_or_email)
    else
      user = User.find_by_username(username_or_email)
    end
    if user && user.match_password(login_password)
      return user
    else
      return false
    end
  end

def match_password(login_password="")
  encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
end

#--------------------------DEFAULT VALUE-----------------------------------------#
before_create :default_values

def default_values
  private_purchased = false
end

end
