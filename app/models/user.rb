class User < ActiveRecord::Base
  # extend FriendlyId
  # friendly_id :email, use: [:slugged, :history]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :topics
  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy

#liked method takes a bookmark object and returns a like object if one exists
  def liked(bookmark)
    likes.where(bookmark_id: bookmark.id).first
  end

  # def should_generate_new_friendly_id?
  #     new_record?
  #   end
end 