namespace :db_generator do
  desc "TODO"
  task g_all: :environment do
    Rake::Task["db_generator:g_customers"].invoke
    Rake::Task["db_generator:g_items"].invoke
    Rake::Task["db_generator:g_images"].invoke
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

  desc "Create many test items to populate the site"
  task g_items: :environment do
    count = 0
    30.times do
      i = Item.new
      inv = i.build_inventory
      inv.inventory_amount = Faker::Number.digit
      i.description = Faker::Lorem.paragraph
       i.keywords = Faker::Lorem.words(4).to_sentence(:last_word_connector => ", ")
      i.unit_price = Faker::Commerce.price.to_d
      i.title = Faker::Commerce.product_name
        
      if i.save
        count += 1
      end
      puts "Creates Item: #{i.title}, id: #{i.id}, count: #{count}"
      
    end
  end

  desc "To create many images associated with each item"
  task g_images: :environment do
    count = 0
    items = Item.all
    items.each  do |i|
      2.times.do
      img = i.images.build
      img.img = Faker::Avatar.image(i.title, "300x300", "jpg")
      if img.save
        count +=1
      end
      puts "Created Image for Item: #{i.title}, id: #{img.id}, count: #{count}"
      end
    end
  end
  
   desc "TODO"
  task g_carts: :environment do
    
  end
  
  desc "TODO"
  task g_order_summaries: :environment do
    #in here also create order details
  end
  
  desc "TODO"
  task g_checkouts: :environment do
    
  end
  
  desc "TODO"
  task g_reviews: :environment do
    
  end

end
