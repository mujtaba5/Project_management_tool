FactoryBot.define do
  factory :organization do
    name { "MyString" }
    tenant_id { "MyString" }
    user { nil }
    project { nil }
  end
end
