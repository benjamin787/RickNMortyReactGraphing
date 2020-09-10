# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ gender: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'
require 'json'
require 'pp'
require 'pry'

max_page = 33 
(0..max_page).to_a.each do |page|
  
  url = 'https://rickandmortyapi.com/api/character?page=33'
  parsedResponse = JSON.parse(RestClient.get(url)) 
  
  results = parsedResponse["results"]
  results.each do |character|
    Character.create(
      name: character["name"],
      status: character["status"],
      species: character["species"],
      character_type: character["type"],
      gender: character["gender"],
      image: character["image"],
    )
  end
end
