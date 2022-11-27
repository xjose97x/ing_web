# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!([
               { email: "admin@admin.com", first_name: "Jose", last_name: "Escudero", birth_date: Date.new(1997, 12, 14), password: "123456", is_admin: true },
               { email: "first@user.com", first_name: "Silvio", last_name: "Rodriguez", birth_date: Date.new(1946, 11, 29), password: "123456" },
               { email: "second@user.com", first_name: "Pablo", last_name: "Milanés", birth_date: Date.new(1943, 12, 24), password: "123456" }
             ])

Category.create!([
                   { title: "Music" },
                   { title: "Videogames" },
                   { title: "Technology" },
                   { title: "Politics" },
                   { title: "Religion" },
                   { title: "Movies" },
                   { title: "Other" },
                 ])

Tag.create!([
              { title: "Tag 1" },
              { title: "Tag 2" },
              { title: "Tag 3" },
              { title: "Tag 4" },
              { title: "Tag 5" },
            ])
