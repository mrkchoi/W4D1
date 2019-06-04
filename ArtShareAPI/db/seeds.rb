# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

ActiveRecord::Base.transaction do
  ArtworkShare.destroy_all
  Artwork.destroy_all
  User.destroy_all
  
  # Users
  3.times do
    User.create(username: Faker::Artist.name)
  end
  
  # Artworks
  
  artist_idx = 0
  9.times do
    Artwork.create(title: Faker::Superhero.power, image_url: Faker::Internet.url, artist_id: User.all[artist_idx].id)
    artist_idx = (artist_idx + 1) % 3
  end

  
  # ArtworkShares

  artist_idx = 0
  artwork_idx = 0
  
  9.times do 
    ArtworkShare.create(artwork_id: Artwork.all[artwork_idx].id, viewer_id: User.all[artist_idx].id)

    artist_idx = (artist_idx + 1) % 3
    artwork_idx = artwork_idx + 1
  end
end