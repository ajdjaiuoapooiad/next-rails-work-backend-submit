class User < ApplicationRecord
    has_secure_password
    has_one :profile
    has_many :messages

    enum user_type: { student: 0, company: 1 }
end
