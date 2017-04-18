# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# automatically create an  account
create_account = User.create([email: 'anndo@rails.com', password: '111111', password_confirmation: '111111', is_admin: 'false'])
puts "1 non-admin account created."

# automatically create an admin account
create_account = User.create([email: 'admin@rails.com', password: '111111', password_confirmation: '111111', is_admin: 'true'])
puts "1 admin account created."

# automatically create public jobs
create_jos = for i in 1..10 do
  Job.create!([title: "Job no.#{i}", description: "#{i} Job", wage_upper_bound: rand(50..99)*100, wage_lower_bound: rand(10..49)*100, contact_email: 'anndo@rails.com', is_hidden: "false"])
end
puts "10 public jobs created."

# automatically create hidden jobs
create_jos = for i in 1..10 do
  Job.create!([title: "Job no.#{i+10}", description: "#{i+10} hidden job", wage_upper_bound: rand(50..99)*100, wage_lower_bound: rand(10..49)*100, contact_email: 'anndo@rails.com', is_hidden: "true"])
end

puts "10 hidden jobs created."
