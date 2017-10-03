class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  mount_uploader :image, PictureUploader

    validates :content, presence: true
    validates :image, presence: true
end
