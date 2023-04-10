### 创建新的rails test 项目

```
$ rails new build-api-with-jbuilder --api
```
### 增加gem
```
gem 'jbuilder', '~> 2.5'
bundle install
```
### 创建新的model
rails g model Category name:string
```
invoke  active_record
create    db/migrate/20230410005906_create_categories.rb
create    app/models/category.rb
invoke    test_unit
create      test/models/category_test.rb
create      test/fixtures/categories.yml
```
```
linlin@linlin-i5:/workspace/build-api-with-jbuilder$ rails g model Source name:string
      invoke  active_record
      create    db/migrate/20230410005908_create_sources.rb
      create    app/models/source.rb
      invoke    test_unit
      create      test/models/source_test.rb
      create      test/fixtures/sources.yml
        ```
linlin@linlin-i5:/workspace/build-api-with-jbuilder$ rails g model Article title:string url:string source:belongs_to category:belongs_to
      invoke  active_record
      create    db/migrate/20230410005913_create_articles.rb
      create    app/models/article.rb
      invoke    test_unit
      create      test/models/article_test.rb
      create      test/fixtures/articles.yml
      ```
      创建 表
      ```
linlin@linlin-i5:/workspace/build-api-with-jbuilder$ rails db:migrate
```
== 20230410005906 CreateCategories: migrating =================================
-- create_table(:categories)
   -> 0.0011s
== 20230410005906 CreateCategories: migrated (0.0011s) ========================

== 20230410005908 CreateSources: migrating ====================================
-- create_table(:sources)
   -> 0.0009s
== 20230410005908 CreateSources: migrated (0.0009s) ===========================

== 20230410005913 CreateArticles: migrating ===================================
-- create_table(:articles)
   -> 0.0025s
== 20230410005913 CreateArticles: migrated (0.0026s) ==========================

```

```
gem 'faker', '~> 1.9.1', group: [:development, :test]
```
$ bundle install

vim seed.rb
```
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
```

```
$ rails db:seed
```


```
rails g controller categories
```

```
rails g controller categories
      create  app/controllers/categories_controller.rb
      invoke  test_unit
      create    test/controllers/categories_controller_test.rb

```
vim  config/routes.rb
```
resources :categories
```
在app/controllers/categories_controller.rb 增加action

```
def index
  @categories = Category.all
end
```
创建目录, file：
```
mkdir -p app/views/categories

app/views/categories/index.json.jbuilder
```
```
json.array! @categories do |category|
  json.id category.id
  json.name category.name
  json.created_at category.created_at
end
```

启动rails
rails s
