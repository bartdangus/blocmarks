# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

10.times do
  Topic.create!(
    title: Faker::Lorem.word
    )

  20.times do
    Bookmark.create!(
      # user: users.sample,
      url: Faker::Internet.domain_name
      # topic: topics.sample
      )
  end
end
