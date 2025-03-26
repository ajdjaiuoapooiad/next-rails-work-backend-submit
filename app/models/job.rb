class Job < ApplicationRecord
    belongs_to :company, class_name: 'User', foreign_key: 'company_id'
    has_many :applications # 応募との関連付け
  
    validates :title, presence: true
    validates :description, presence: true
    validates :location, presence: true
    validates :salary, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  
    # 他の属性やバリデーションも追加可能
end