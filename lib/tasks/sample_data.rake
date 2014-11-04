namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_articles
    make_sections
    make_citations
    make_authors
    make_publications
    #make_journals
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
    cited_article = Article.all.sample
    if cited_article != article
      article.cite!(cited_article)
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

def make_publications
  articles = Article.limit(10)
  articles.each do |article|
    issue = Faker::Number.digit
    year = 2014
    volume = Faker::Number.digit
    article.publication = Publication.create(issue: issue, year: year, volume: volume)
  end
end









