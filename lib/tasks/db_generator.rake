namespace :db_generator do
  desc "TODO"
  task g_all: :environment do
    Rake::Task["db_generator:g_customers"].invoke
    Rake::Task["db_generator:g_items"].invoke
    Rake::Task["db_generator:g_images"].invoke
    Rake::Task["db_generator:g_reviews"].invoke
  end

  
  desc "fix title names to make all titleized not all upper case"
  task un_capitalize: :environment do
     items = Item.all
    items.each do |i|
      i.update_attributes(title: i.title.titleize)
    end
    puts "Titleized all items titles"
  end
  
  desc "Genereate random users for the database"
  task g_customers: :environment do
    count = 0
    admin_emails = ["gkulasik@gmail.com", "LKHAMIS84@YAHOO.COM", "JosephTRichard@gmail.com", "ray153056@gmail.com", "GONET90@GMAIL.COM", "bburton12@comcast.net", "IAMBLAND1990@GMAIL.COM"]
    30.times do 
      c = Customer.new
      c.name = Faker::Name.name
      if admin_emails[count].nil?
      c.email = Faker::Internet.safe_email
      else
        c.email = admin_emails[count]
        c.admin = true
      end
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
    # generate admins
        
    
  
  end

  desc "Create many test items to populate the site"
  task g_items: :environment do
    count = 0
    30.times do
      i = Item.new
      inv = i.build_inventory
      inv.inventory_amount = rand(15..200)
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
  desc "Create Item reviews that are tied to items and customers randomly"
  task g_reviews: :environment do
    @items = Item.all
    @customers = Customer.all.select(:id)
    @items.each do |f|
      5.times do
        review = f.item_reviews.build
        review.rating = rand(1..5)
        review.comments = Faker::Lorem.paragraph
        review.customer = Customer.find(Customer.all.select(:id).sample(1).first.id)
        if review.save
          puts "Created Review for Item: #{f.title}, rating: #{review.rating}"
        end
      end
    end
  end
  desc "To create many images associated with each item"
  task g_images: :environment do
    count = 0
    items = Item.last(10)
    items.each  do |i|
#       2.times do
      img = i.images.build
      img.img = Faker::Avatar.image(i.title.parameterize.underscore , "300x300", "jpg")
      if img.save
        count +=1
      end
      puts "Created Image for Item: #{i.title}, id: #{img.id}, count: #{count}"
#       end
    end
  end
  
  
  


end
