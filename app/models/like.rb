class Like < ActiveRecord::Base

#considered a simple join table, that represents a relation between two objects (user/bookmark)
belongs_to :user
belongs_to :bookmarks
end
