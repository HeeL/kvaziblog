FactoryGirl.define do
  factory :post do
    title 'Title of the Article'
    desc 'Description of the Article'
    text "Text of the Article. Let's make sure it's not too small."

    active true
  end
end