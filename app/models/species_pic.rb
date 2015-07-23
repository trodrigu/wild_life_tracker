class SpeciesPic < ActiveRecord::Base
  belongs_to :species
  belongs_to :user
  has_attached_file :avatar,
    :styles => { 
    :medium => '300x300>', 
    :thumb => '100x100>' 
  }
  validates_attachment :avatar, presence: true
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, :attributes => :avatar, :less_than => 2.megabytes
end
