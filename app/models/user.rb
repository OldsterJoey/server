class User < ApplicationRecord
    has_secure_password
    has_many :child_profiles
    has_many :admin_profiles
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
end
