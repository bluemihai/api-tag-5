FactoryGirl.define do
  factory :player do
    name 'MyString'
    email { "#{name}@example.com".downcase }
    role 'user'
    fictional false
  end
end
