# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Note.destroy_all
User.destroy_all

user1 = User.create!(name: "Joe User", email: "joeuser@gmail.com", password: "pass123")
note1 = Note.create!(title: "Todays Notes", body: "these are my notes for today", created_at: "Friday 12:00", user_id: user1.id  )
note2 = Note.create!(title: "More Notes", body: "these are more notes I took", created_at: "Monday 1:00", user_id: user1.id  )