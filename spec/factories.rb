FactoryGirl.define  do
  factory :article do
    title "title"
    journal "journal"
    year 2014
    volume "1"
    issue "1"
    abstract "abstract"
    
  end

  factory :author do
  	first_name "first_name"
  	last_name "last_name"
  	
  end

end