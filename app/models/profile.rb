# app/models/profile.rb
class Profile < ApplicationRecord
  belongs_to :user

  validates :introduction, length: { maximum: 1000 }, allow_blank: true
  validates :skills, length: { maximum: 1000 }, allow_blank: true
  validates :company_name, length: { maximum: 100 }, allow_blank: true
  validates :industry, length: { maximum: 100 }, allow_blank: true
end