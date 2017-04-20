# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

create_account = User.create([email: 'admin@gmail.com', password: '111111', password_confirmation: '111111', is_admin: 'true'])
puts 'Admin account is created successfully!'

create_account = User.create([email: 'anndo@gmail.com', password: '111111', password_confirmation: '111111', is_admin: 'false'])
puts 'Admin account is created successfully!'

job_company =
[
  'Google',
  'amazon',
  'Uber',
  'Apple',
  'Microsoft',
]

job_category = [
  'Engineering & Technology',
  'Sales, Service & Support',
  'Marketing & Communications',
  'Business Strategy',
  'Design',
]

job_title = [
  'Account Manager',
  'New Business Sales',
  'Analyst',
  'Sales Engineer',
  'Test Engineer',
  'Creative Designer',
  'Events Planner',
]

job_description = [
  'Deliver engaging content and communications with your strategy and publishing experience.',
  'Plan, produce, and execute impactful events throughout Google.',
  'Define and evolve Google’s design and creative direction when you produce creative digital assets and branding materials.',
  'Create innovative and strategic plans and campaigns to engage Googlers across the globe.',
  'Draw strategic insights and create solutions from complex data.',
  'Develop external communications strategies to captivate global audiences through compelling written and visual media.'
]

job_city = [
  'Tokyo',
  'Taipei',
  'New York, NY',
  'San Francisco, CA',
  'Beijing',
  'London',
]

create_jobs =

for i in 1..10 do
  Job.create!([
    company: job_company[rand(job_company.length)],
    category: job_category[rand(job_category.length)],
    title: job_title[rand(job_title.length)],
    description: job_description[rand(job_title.length)],
    wage_upper_bound: rand(40..79) * 1000,
    wage_lower_bound: rand(20..39) * 1000,
    city: job_city[rand(job_city.length)],
    is_hidden: 'false'
  ])
end

for i in 1..10 do
  Job.create!([
    company: job_company[rand(job_company.length)],
    category: job_category[rand(job_category.length)],
    title: job_title[rand(job_title.length)],
    description: job_description[rand(job_title.length)],
    wage_upper_bound: rand(40..79) * 1000,
    wage_lower_bound: rand(20..39) * 1000,
    city: job_city[rand(job_city.length)],
    is_hidden: 'false'
  ])
end

puts '10 Public jobs created.'
puts '10 Hidden jobs created.'
