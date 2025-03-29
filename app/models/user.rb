class User < ApplicationRecord
    has_secure_password
    has_one :profile
    has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'
    has_many :received_messages, class_name: 'Message', foreign_key: 'receiver_id'
    has_many :jobs, foreign_key: 'company_id'
  
    enum user_type: { student: 0, company: 1 }

    validates :name, presence: true, length: { maximum: 255 }
    validates :email, presence: true, uniqueness: { case_sensitive: false, message: "は既に存在します" }, format: { with: URI::MailTo::EMAIL_REGEXP } # uniqueness: true を追加
    validates :password, presence: true, length: { minimum: 6 }, if: :password_digest_changed?
  end