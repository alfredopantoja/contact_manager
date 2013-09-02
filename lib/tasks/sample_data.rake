namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_people
  end
end  

def make_people
  99.times do |n|
    first_name = Faker::Name.first_name
    last_name  = Faker::Name.last_name
    Person.create!(first_name: first_name,
                 last_name:  last_name)
  end
end  
