# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'



admin = User.create!(name: 'John', email: 'jtr022@gmail.com', password: 'cool', role: 1)

CSV.foreach('db/data/color_examples.csv', headers: true, header_converters: :symbol) do |color|
  admin.colors.create(
    name:       color[:name],
    hex_value:  color[:hex_value]
    )
end

puts "There are now #{Color.count} colors in the database"