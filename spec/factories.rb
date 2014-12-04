FactoryGirl.define  do
  
  factory :journal do
  	sequence(:name) { |n| "Name #{n}"}
  end

  factory :publication do
  	sequence(:year) { |n| "Year #{n}" }
  	sequence(:issue) { |n| "Issue #{n}" }
  	sequence(:volume) { |n| "Volume #{n}" }
    journal
  end
  
  factory :section do
    sequence(:heading) { |n| "Heading #{n}" }
    sequence(:content) { |n| "Lorum Ipsum"*10}
    article
  end

  factory :article do
    sequence(:title)    { |n| "Title #{n}"    }
    sequence(:abstract) { |n| "Abstract #{n}"}
    publication
  
    factory :article_with_sections do
      transient do
      	sections_count 5
      end
      after(:create) do |article, evaluator|
      	create_list(:section, evaluator.sections_count, article: article)
      end
    end
  end

  factory :author do
  	sequence(:first_name) { |n| "First_Name #{n}" }
  	sequence(:last_name)  { |n| "Last_Name #{n}"  }
  end

  factory :user do
    sequence(:email) { |n| "Email_#{n}@Example.com"}
    sequence(:password) { |n| "Password_#{n}"}
  end
end 