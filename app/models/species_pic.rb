class SpeciesPic < ActiveRecord::Base
  belongs_to :species
  belongs_to :user
  has_attached_file :avatar, :styles => { :medium => '300x300>', :thumbnail => '100x100>' }
  validates_attachment :avatar, presence: true
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_with AttachmentSizeValidator, :attributes => :avatar, :less_than => 2.megabytes
end
