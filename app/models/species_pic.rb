class SpeciesPic < ActiveRecord::Base
  belongs_to :species
  belongs_to :user
  has_attached_file :avatar
  validates_attachment :avatar, presence: true
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
