class User < ApplicationRecord
    validates :name, presence: true,length: { maximum: 20 }
    validates :email, presence: true,length: { maximum: 180},
                      format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    before_validation { email.downcase! }
    
    has_secure_password
    
    has_many:pictures
    has_many :favorites, dependent: :destroy
    validates:password,presence: true, length: { minimum: 8 }
end
