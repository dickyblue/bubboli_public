require 'digest'

class User < ActiveRecord::Base
  
  attr_accessor   :password
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :address_city, :address_state
  attr_protected  :admin
  
  has_many :relationships
  has_many :relation_types, :through => :relationships
  has_many :children, :through => :relationships

  has_many :sent_invitations, :class_name => 'Invitation', :foreign_key => 'sender_id'
  belongs_to :invitation 
  
  email_regex = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

  validates :email,                   :presence => true,
                                      :uniqueness => { :case_sensitive => false },
                                      :format => { :with => email_regex },
                                      :on => :save
                                      
  validates :work_email,              :uniqueness => { :case_sensitive => false },
                                      :format => { :with => email_regex },
                                      :on => :save

  validates :first_name,              :presence => true
  
  validates :password, :if => :should_validate_password?,                 :presence => true, 
                                                                    :confirmation => true
  
  before_save :encrypt_password, :unless => "password.blank?"
  
  def should_validate_password?
    new_record?
  end
  
  def has_password?(submitted_password)
    password_hash == encrypt(submitted_password)
  end
  
  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end
  
  def self.authenticate_with_password_salt(id, cookie_password_salt)
    user = find_by_id(id)
    (user && user.password_salt == cookie_password_salt) ? user : nil
  end
  
  def before_update
  	if !password.blank?
  		self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  	end
  end
  
  def following
    relationships.where(:status => "Confirmed")
  end
  
  def pending
    relationships.where(:status => "Pending")
  end

  def my_kids
    relationships.where(:relation_type_id => [1,2])    
  end

  def followers
    my_kids.each do |kid|
    end
  end
  
  private
  
    def encrypt_password
      self.password_salt = make_password_salt if new_record?
      self.password_hash = encrypt (password)
    end
    
    def encrypt(string)
      secure_password_hash("#{password_salt}--#{string}")
    end
    
    def make_password_salt
      secure_password_hash("#{Time.now.utc}--#{password}")
    end
    
    def secure_password_hash(string)
      Digest::SHA2.hexdigest(string)
    end
  

end
