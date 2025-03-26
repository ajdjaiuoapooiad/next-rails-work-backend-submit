class User < ApplicationRecord
    has_secure_password
    has_one :profile
    has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'
    has_many :received_messages, class_name: 'Message', foreign_key: 'receiver_id'
    has_many :jobs, foreign_key: 'company_id'
  
    enum user_type: { student: 0, company: 1 }
  end