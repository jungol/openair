FactoryGirl.define  do
  factory :article do
    sequence(:title)    { |n| "Title #{n}"    }
    sequence(:abstract) { |n| "Abstract #{n}" }
    

  end

  factory :author do
  	sequence(:first_name) { |n| "First_Name #{n}" }
  	sequence(:last_name)  { |n| "Last_Name #{n}"  }
  end
end


