class User < ApplicationRecord
    has_secure_password
    has_one :profile
    has_many :messages
    has_many :jobs, foreign_key: 'company_id' # 追加

    enum user_type: { student: 0, company: 1 }
end
