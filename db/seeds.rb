# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

q1 = Question.create(title: "There's a cat in my database and everything is coming up mew!", description: "#{Faker::Hipster.paragraph(6, true)}")
q2 = Question.create(title: "#{Faker::Hipster.sentence(10)}", description: "#{Faker::Hipster.paragraph(6, true)}")
q3 = Question.create(title: "#{Faker::Hipster.sentence(10)}", description: "#{Faker::Hipster.paragraph(6, true)}")
