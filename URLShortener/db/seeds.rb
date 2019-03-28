# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 4.times.each do
#   TagTopic.create!(topic_name: Faker::Dessert.variety)
# end

Tagging.new(ShortenedUrl.first.id, TagTopic.first.id)
Tagging.new(ShortenedUrl.second.id, TagTopic.second.id)
Tagging.new(ShortenedUrl.first.id, TagTopic.third.id)
