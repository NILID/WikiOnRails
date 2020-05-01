FactoryBot.define do
  factory :section do
    name { 'Section Name' }
    content { 'Content Text' }
    page
    position { 1 }
  end
end
