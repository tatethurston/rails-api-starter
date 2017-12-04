FactoryBot.define do
  factory :user do
    name 'Tate'
    password 'test'
    email 'tatethurston@gmail.com'
    token SecureRandom.uuid
  end
end
