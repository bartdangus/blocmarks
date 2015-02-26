class Bookmark < ActiveRecord::Base

    belongs_to :topic, dependent: :destroy
    belongs_to :user
    has_many :likes, dependent: :destroy
end
