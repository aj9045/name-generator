# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

CSV.foreach('db/last_names.csv') do |name|
  LastName.create(last_name: "#{name[0]}")
end

CSV.foreach('db/first_names.csv') do |name|
  FirstName.create(first_name: "#{name[0]}")
end
