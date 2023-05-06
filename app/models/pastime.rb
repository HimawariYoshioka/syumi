class Pastime < ApplicationRecord
    belongs_to :user 
    has_many :favorites, dependent: :destroy
    has_many :favorited_users, through: :favorites, source: :user
    has_many :comments, dependent: :destroy

    mount_uploader :image, ImageUploader
    
end
