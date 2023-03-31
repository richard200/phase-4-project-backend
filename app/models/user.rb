class User < ApplicationRecord
    has_many :recipes
    has_many :reviews

    has_secure_password

    validates :name, presence: true, length: { minimum: 2 }
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, presence: true, length: { minimum: 8 }, format: { with: /\A(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*()\-_=+{}\[\]\\|;:'",.<>\/?]).{8,}\z/ }, on: :create
end
