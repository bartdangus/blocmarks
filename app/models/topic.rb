class Topic < ActiveRecord::Base
  # extend FriendlyId
  #   friendly_id :title, use: [:slugged, :history]

  belongs_to :user
  has_many :bookmarks

  # def should_generate_new_friendly_id?
  #     new_record?
  #   end
  end
