class Profile < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthday, presence: true
  validates :zip_code, presence: true
  validates_uniqueness_of :user_id
end
