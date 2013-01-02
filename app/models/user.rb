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
  
  has_many  :gift_accessions
  has_many  :gifts, :through => :gift_accessions 
  has_many  :children, :through => :gift_accessions
  
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
  after_create :send_confirmation_token
  
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
  
  def send_confirmation_token
    generate_token(:confirmation_token)
    self.confirmation_token_sent_at = Time.zone.now
    save!
    UserMailer.account_confirmation(self).deliver
  end
  
  def confirm!
    self.confirmed = true
    self.confirmation_token = nil
    save(:validate => false)
  end
  
  def following?(child)
    followings.find_by_child_id(child)
  end

  def requested?(child)
    relationships.find_by_child_id(child)
  end
  
  def unfollow!(child)
    relationships.find_by_child_id(child.id).destroy
  end
  
  def ignore!(relationship)
    my_kids_requests.detect{|p| p.id == relationship.id}.destroy
  end

  def approve!(relationship)
    my_kids_requests.detect{|p| p.id == relationship.id}.update_attributes(:status => "Confirmed", :accepted_at => Time.now)
  end
  
  def followings
    relationships.where(:status => "Confirmed")
  end
  
  def pending
    relationships.where(:status => "Pending")
  end

  def my_kids
    relationships.where(:relation_type_id => [1,2]).map {|p| p.child }   
  end

  def my_kids_followers
    my_kids.collect(&:child_followers).flatten.collect(&:user).uniq
  end
  
  def my_kids_requests
    my_kids.collect(&:child_requests).flatten
  end
    
  private
  
    def generate_token(column)
      begin
        self[column] = SecureRandom.urlsafe_base64
      end while User.exists?(column => self[column])
    end
  
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
