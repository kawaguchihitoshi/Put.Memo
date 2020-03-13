class Message < ApplicationRecord
  belongs_to :user
  has_many :messages_tags
  has_many :tags,  through:  :messages_tags
  has_many :likes
  has_many :users,  through:  :like
  
  validates :content, presence: true, unless: :image?

  mount_uploader :image, ImageUploader
  acts_as_taggable
end
