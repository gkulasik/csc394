namespace :db_generator do
  desc "TODO"
  task g_all: :environment do
    Rake::Task["db_generator:g_customers"].invoke
  end

  desc "Genereate random users for the database"
  task g_customers: :environment do
    count = 0
    30.times do 
      c = Customer.new
      c.name = Faker::Name.name
      c.email = Faker::Internet.safe_email
      c.address = Faker::Address.street_address
      c.city = Faker::Address.city
        c.state_province = Faker::Address.state
      c.postal_code = Faker::Address.postcode
      country = Country.find_country_by_name(Faker::Address.country) || Country.find_country_by_name("United States")
      c.country = country.alpha2
      c.phone_number = "8472313456"
      c.password = "password123"
      c.password_confirmation = "password123"
      if c.save
        count += 1
      end
      puts "Created #{c.name}, id: #{c.id}, count: #{count}"
    end
  end

  desc "TODO"
  task g_items: :environment do
    
  end

  desc "TODO"
  task g_reviews: :environment do
    
  end

end
