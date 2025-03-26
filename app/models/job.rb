class Job < ApplicationRecord
  belongs_to :company, class_name: 'User', foreign_key: 'company_id'
end
