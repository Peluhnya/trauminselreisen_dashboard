# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
["TUI", "Airtours", "FTI", "Jumbo", "DerTour", "Manta", "EWTC", "Booking.com"].each do |site|
  Site.create(name: site, active: true)
end
["Soneva Fushi", "OZEN by Atmosphere", "Vakkaru", "Anantara Kihavah",
 "One&Only Reethi Rah", "Gili Lankanfushi", "Six Senses Yao Noi",
 "Banyan Tree Samui", "Saadiyat Rotana Resort & Villas",
 "The Palace Downtown Dubai", "Atlantis the Palm", "Burj al Arab"].each do |hotel|
  hotel = Hotel.create(name: hotel, active: true)
  Site.all.each do |site|
    HotelSite.create(hotel_id: hotel.id, site_id: site.id)
  end
end
