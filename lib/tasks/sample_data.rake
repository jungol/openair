namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_ivory_tower
  end
end

# The make_[model] functions do not build up associations, even 
# if they are required for validation. This allows for flexibility
# as models and associations change. The make_ivory_tower function 
# builds up the associations to populate the site. 

def make_ivory_tower
  5.times do |n| 
    user = make_user
    journal = make_journal
    journal.save!
    publication = make_publication
    article = make_article
    section_array = []
    3.times { |n| section_array << make_section }
    author = make_author
    journal.publications << publication
    publication.articles << article
    article.authors << author
    section_array.each { |section| article.sections << section }
  end
end

def make_journal
  Journal.create!(
    name: "Journal of #{Faker::Company.catch_phrase}"
  )
end

def make_publication
  Publication.new(
    issue: Faker::Number.digit, 
    volume: Faker::Number.digit, 
    year: 1776, 
  )
end

def make_article
  Article.new(
    title: Faker::Lorem.sentence, 
  )
end

def make_section
  Section.new(
    heading: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraph(20)
  )
end

def make_author
  Author.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.first_name
  )
end

def make_user
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end












