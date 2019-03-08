# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all
Dog.delete_all

sarah = User.create!({email: 'sarah23@gmail.com',  password:'password', name: "Sarah"})
jess = User.create!({email: 'Jess54@gmail.com',  password:'password', name: "Jess"})
chris = User.create!({email: 'chris@gmail.com',  password:'password', name: "Chris"})
mike = User.create!({email: 'mike@gmail.com',  password:'password', name: "Mike"})
john = User.create!({email: 'john@gmail.com',  password:'password', name: "John"})
sam = User.create!({email: 'foodcritic@gmail.com', password:'password', name: "Sam"})
casey = User.create!({email: 'chicfashion@gmail.com', password:'password', name: "Casey"})

dogs = [
  {
    name: 'Bowie',
    description: 'Bowie dances when he walks',
    owner_id: sarah.id
  },
  {
    name: 'Brownie',
    description: 'Brownie only sits pretty',
    owner_id: jess.id

  },
  {
    name: 'Jax',
    description: '',
    owner_id: mike.id
  },
  {
    name: 'Jiro',
    description: 'Jiro takes a long time to destroy his toys',
    owner_id: mike.id
  },
  {
    name: 'Pete',
    description: 'Pete has a best friend named Lua',
    owner_id: sam.id
  },
  {
    name: 'Bijou',
    description: 'Bijou is the fluffiest of them all',
    owner_id: casey.id
  },
    {
    name: 'Britta',
    description: 'Britta has two different colored eyes',
    owner_id: john.id
  },
  {
    name: 'Noodle',
    description: 'Noodle is an Instagram celebrity',
    owner_id: sarah.id
  },
  {
    name: 'Stella',
    description: 'Stella loves to dig',
    owner_id: john.id
  },
  {
    name: 'Tonks',
    description: 'Tonks loves to run',
    owner_id: chris.id,
  },
]

dogs.each do |dog|
  dog = Dog.find_or_create_by(name: dog[:name], description: dog[:description], owner_id: dog[:owner_id])
  directory_name = File.join(Rails.root, 'db', 'seed', "#{dog[:name].downcase}", "*")

  Dir.glob(directory_name).each do |filename|
    if !dog.images.any?{|i| i.filename == filename}
      dog.images.attach(io: File.open(filename), filename: filename.split("/").pop)
      sleep 1
    end
  end
end
