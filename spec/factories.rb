FactoryBot.define do
  factory :treasury_output, class: 'Treasury::Output' do
    input_date { "2021-08-21 21:00:35" }
    description { "MyText" }
    quantity { "9.99" }
    treasury_petty_cash { nil }
  end

  factory :treasury_input, class: 'Treasury::Input' do
    input_date { "2021-08-21 20:50:59" }
    description { "MyText" }
    quantity { "9.99" }
    treasury_petty_cash { nil }
  end

  factory :treasury_petty_cash, class: 'Treasury::PettyCash' do
    start_date { "2021-08-21 20:32:22" }
    end_date { "2021-08-21 20:32:22" }
  end

  factory :purchase do
    
  end

  factory :company_detail do
    
  end

  factory :invoice do
    
  end

  factory :specification_product do
    specification_value
    item
  end

  factory :specification_value do
    value { Faker::Beer.name }
    specification
  end

  factory :specification do
    name { Faker::Beer.name }
  end

#  factory :line_item do
#    productable nil
#    sale nil
#    detail "MyString"
#    quantiy 1
#    unit_price "9.99"
#    total_price "9.99"
#  end
#  factory :sale do
#    amount "9.99"
#    total_amount "9.99"
#    remaining_amount "9.99"
#    discount "9.99"
#    tax "9.99"
#    customer nil
#  end
#  factory :service do
#    name "MyString"
#    price "9.99"
#  end
#  factory :invoice_dosage do
#    authorization_number "MyString"
#    emission_deadline "2019-02-12 15:40:32"
#    invoice_initial_number 1
#    dosage_key "MyString"
#    economic_activity "MyString"
#    active false
#  end
  factory :output do
    item
    output_date {"2019-02-09 20:12:17"}
    description {"MyText"}
    quantity {1}
  end

  factory :category do
    name { Faker::Beer.name }
    description { Faker::Beer.brand }
  end

  factory :item do
    upc  { Faker::Books::Lovecraft }
    sku { Faker::Beer.brand }
    name { Faker::Beer.name }
    description {Faker::Games::Fallout}
    input {1}
    output {1}
    amount_stock {1}
    price {"9.99"}
    cost_price {"9.99"}
    published {false}
    category
  end

  factory :supplier do
    name { Faker::Beer.name }
    address {"MyText"}
    cellphone {"3175489822"}
    identifier {"0001"}
  end
  
  factory :input do 
    input_date {"2019-02-09 20:11:54"}
    description {"MyText"}
    quantity {1}
    item
    supplier
  end

#  factory :customer do
#    first_name "MyString"
#    last_name "MyString"
#    sex "MyString"
#    number_id "MyString"
#    born_date "2018-07-24 11:20:04"
#    nationality "MyString"
#    living_place "MyString"
#    address "MyString"
#    civil_status "MyString"
#    job "MyString"
#    company_name "MyString"
#    position "MyString"
#    money_income "9.99"
#    work_address "MyString"
#    working_time "MyString"
#    work_phone "MyString"
#  end

  factory :user do
    email {Faker::Internet.email}
    password {"admin123"}
    confirmed_at {'01-01-2021'}
  end
  factory :confirmed_user, :parent => :user do
    after(:create) { |user| user.confirm! }
  end

  factory :store do 
    name {Faker::Name.name}
    description { Faker::Company.bs }
  end
#  factory :account do
#    subdomain "abc"
#    owner_id 1
#  end
end
