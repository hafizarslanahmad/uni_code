class User < ApplicationRecord
    has_many :hecs, dependent: :destroy
    has_one :university

    has_secure_password

    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address"}



    ROLES = %w{admin}


    def admin?
        role == "admin"
    end

    def university?
        role == "university"
    end
end
