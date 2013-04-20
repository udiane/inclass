namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    users = User.all(limit: 6)
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
  end
end
