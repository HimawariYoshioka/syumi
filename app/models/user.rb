class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :image, ImageUploader
  devise :database_authenticatable, :registerable,
      :recoverable, :rememberable, :validatable
      has_many :pastimes, dependent: :destroy
      has_many :favorites, dependent: :destroy
      has_many :favorited_pastimes, through: :favorites, source: :pastime
      has_many :comments, dependent: :destroy
      validates :name, presence: true 
      validates :profile, length: { maximum: 200 } 

      has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy

      has_many :followings, through: :following_relationships
     
      has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
     
      has_many :followers, through: :follower_relationships
     
       def following?(other_user)
         following_relationships.find_by(following_id: other_user.id)
       end
     
       def follow!(other_user)
         following_relationships.create!(following_id: other_user.id)
       end
     
       def unfollow!(other_user)
         following_relationships.find_by(following_id: other_user.id).destroy
       end

  def already_favorited?(pastime)
    self.favorites.exists?(pastime_id: pastime.id)
  end
        end
