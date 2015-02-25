class Profile < ActiveRecord::Base
  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthday, presence: true
  validates :zip_code, presence: true
end
