class User < ApplicationRecord
    validates :name, presence: true,length: { maximum: 20 }
    validates :prof_image, presence: true
    validates :email, presence: true,length: { maximum: 180},
                      format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    before_validation { email.downcase! }
    has_secure_password
    
    validates:password,presence: true, length: { minimum: 8 }
    
    mount_uploader :prof_image, ImageUploader
    
    has_many :pictures
    has_many :favorites, dependent: :destroy
    
end
