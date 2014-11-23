FactoryGirl.define do
  factory :blog_post do
    sequence(:title){|n| "tiitle##{n}"}
    post 'some posthhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh'
    path 'titttttle'


    factory :blog_post_with_tags do
      transient do
        tags_count 5
      end

      after(:build) do |blog_post, evaluator|
        blog_post.tags = FactoryGirl.build_list(:tag, evaluator.tags_count)
      end

      factory :bad_blog_post do
        post 'nnn'
      end
    end
  end
end