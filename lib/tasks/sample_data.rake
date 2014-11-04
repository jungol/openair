namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_journals
    make_publications
    make_articles
    make_sections
    make_authors
    make_citations
  end
end

def make_journals
  2.times do
    Journal.create!(name: "Journal of #{Faker::Company.catch_phrase}")
  end
end

def make_publications
  journals = Journal.all
  2.times do
    issue = Faker::Number.digit
    year = 2014
    volume = Faker::Number.digit
    journals.each { |journal| journal.publications.create!(issue: issue, year: year, volume: volume )}
  end
end

def make_articles
  publications = Publication.all
  2.times do
    title = Faker::Lorem.sentence
    abstract = Faker::Lorem.paragraph
    publications.each { |publication| publication.articles.create!(title: title, abstract: abstract)}
  end
end

def make_sections
  articles = Article.all
  2.times do
    heading = Faker::Lorem.sentence
    content = Faker::Lorem.paragraph
    articles.each { |article| article.sections.create!(heading: heading, content: content)}
  end
end

def make_authors
  articles = Article.all
  2.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name      
    articles.each { |article| article.authors.create!(first_name: first_name, last_name: last_name)}
  end
end


def make_citations
  articles = Article.all
  2.times do
    other_article = articles.all.sample
    articles.each do |article|
      article.cite!(other_article) unless article == other_article
    end
  end
end



















