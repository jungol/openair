namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_articles
    make_sections
    make_citations
    make_authors
  end
end

def make_articles
  10.times do |n|
    title = Faker::Lorem.sentence
    abstract = Faker::Lorem.paragraph
    Article.create!(title: title,
                    abstract: abstract)
  end
end

def make_sections
  articles = Article.limit(10)
  articles.each do |article|
    5.times do
      heading = Faker::Lorem.sentence
      content = Faker::Lorem.paragraph
      article.sections.create!(heading: heading, content: content)
    end
  end
end

def make_citations
  articles = Article.limit(10)
  articles.each do |article|
    2.times do
      cited_article = Article.all.sample
      article.cite!(cited_article) unless (cited_article == article)
    end
  end
end

def make_authors
  articles = Article.limit(10)
  articles.each do |article|
    2.times do
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      article.authors.create!(first_name: first_name, last_name: last_name)
    end
  end
end

