class User < ApplicationRecord
  #  before_create :confirmation_token
    has_many :security
    has_many :notifications
    has_many :camera_settings
    has_secure_password
    attr_accessor :remember_token
    validates_presence_of :name, :surname, :email, :house, :street, :city,:login
    validates_uniqueness_of :login
    validates :email, :telegram, :iin, uniqueness: true, allow_nil: true 
    validates :password, length:{minimum: 6, maximum: 30},on: :create
    validates :password, format: { with: /\A[0-9a-zA-Z_.\-]+\Z/, message: "Only alphanumeric characters, and -_."}
    validates_email_format_of :email, message: 'The email format is not correct!'
    before_create {self.email = email.downcase}
    def update_with_password(params, *options)
        if encrypted_password.blank?
          update_attributes(params, *options)
        else
          super
        end
      end
    class << self
        def digest(string)
            cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
            BCrypt::Password.create(string, cost: cost)
        end

        def new_token
            SecureRandom.urlsafe_base64
        end
    end
    def send_password_reset_email
        new_password=SecureRandom.urlsafe_base64
        self.update_attribute(:password, new_password)
        UserMailer.password_reset(self,new_password).deliver_now
    end
    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end
   # def email_activate
   #     self.email_confirmed = true
   #     self.confirm_token = nil
   #     save!(:validate => false)
   # end
    def authenticated?(attribute, token)
        digest = send("#{attribute}_digest")
        return false if digest.nil?
        BCrypt::Password.new(digest).is_password?(token)
    end
    def forget
        update_attribute(:remember_digest, nil)
    end
    private
    #def confirmation_token
     # if self.confirm_token.blank?
     #    self.confirm_token = SecureRandom.urlsafe_base64.to_s
      #end
    #end
end
