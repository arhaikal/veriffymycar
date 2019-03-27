FactoryBot.define do
  factory :location do
    name { "LAX" }
    city { "Los Angeles" }
    country { "USA" }
  end

  factory :vehicle do 
    reg_number  {'ABC123'}
    available_indicator { true }
    make {'Mercedes'}
    model  {'AMG'}
    year {2017}
  end

  factory :user do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    email { FFaker::Internet.email }
    password { FFaker::Internet.password }
    gender { FFaker::Gender.random }
    id_number { '121411'}
    date_of_birth { FFaker::Time.date }
    citizenship { FFaker::Address.country }
  end

  factory :document do
    number {'BA122412'}
    document_type {'PASSPORT'}
    country {'Latvia'}
    valid_from {'23-12-2019'}
    valid_until {'23-12-2029'}
    user
  end
  
  factory :verification_session do
    id {'82c90c22-c8a8-412c-8e0e-f3f27b385071'}
    status {'submitted'}
    document
    user
  end

  factory :photo do 
    face { File.new("#{Rails.root}/spec/support/face.jpg")  }
    document_front { File.new("#{Rails.root}/spec/support/document_front.jpg")  }
    document_back { File.new("#{Rails.root}/spec/support/document_back.jpg")  }
    document
  end 
  
end
