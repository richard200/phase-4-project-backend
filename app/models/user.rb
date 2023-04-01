class User < ApplicationRecord
    has_many :recipes
    has_many :reviews

    has_secure_password

    # validates :username, { 
    #     length: { minimum: 5, maximum: 8 }, 
    #     uniqueness: true,
    #     presence: true 
    # } 
    # validates :email, presence: true, uniqueness: true
    # validates :password, presence: true, length: { minimum: 8 }, format: { with: /\A(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*()\-_=+{}\[\]\\|;:'",.<>\/?]).{8,}\z/ }, on: :create
end
