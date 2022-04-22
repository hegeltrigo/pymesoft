user = User.new(email: 'admin@demo.com', password: 'admin123', password_confirmation: 'admin123')
user.skip_confirmation!

account = Account.new(subdomain: 'demo')
account.owner = user

if account.valid?
  Apartment::Tenant.create(account.subdomain)
  Apartment::Tenant.switch!(account.subdomain) 

  account.save

  10.times.each do |num|
    p "creating category #{num}"
    Category.create name: Faker::Food.fruits , description: Faker::Food.ingredient
  end
  
  100.times.each do |num|
    p "creating product #{num}"
    Item.create name: Faker::Food.dish,
                description: Faker::Food.description,
                upc: Faker::Number.number(10),
                sku: Faker::Number.number(12),
                price: Faker::Number.number(2),
                cost_price: Faker::Number.number(2),
                published: true,
                category: Category.all.sample

  end 

  100.times.each do |num|
    p "creating customer #{num}"            
    Customer.create first_name: Faker::Name.first_name,
                    last_name: Faker::Name.last_name,
                    nit: Faker::Number.number(7),
                    sex: ['Femenino', 'Masculino'].sample,
                    image: Faker::Avatar.image
  end 
  
  30.times.each do |num|
    p "creating service #{num}"            
    Service.create name: Faker::Beer.name, price: Faker::Number.number(3)             
  end 
  
end


