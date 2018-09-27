FactoryGirl.define do
  factory :task do
    title "MyString"
    description "MyString"
    done false
    deadline "2018-09-27 00:53:21"
    user nil
  end
end
