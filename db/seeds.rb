require 'faker'
User.destroy_all
Mountain.destroy_all

10.times do

  User.create do |u|
    u.name = Faker::Name.name
    u.email = Faker::Internet.email
    u.password = 'password'
  end

  Mountain.create do |m|
    m.name = Faker::GreekPhilosophers.name
    m.elevation = Faker::Number.number(digits: 5)
  end
end

User.all.each do |user|
  3.times do
    user.mountains << Mountain.all.sample
  end
end