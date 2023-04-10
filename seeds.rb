# seeds.rb

# Create Categories
10.times { Category.create!(name: Faker::Lorem.word) }

# Create sources
10.times { Source.create!(name: Faker::Company.name) }

# Create Articles
50.times {
  category = Category.all.sample
  source = Source.all.sample
  Article.create!(
    title: Faker::Lorem.sentence,
    url: Faker::Internet.url,
    category: category,
    source: source
  )
}
