FactoryGirl.define do
  factory :tag do
    sequence(:name){|n| "tag ##{n}"}

    factory :bad_tag do
      name 'n'
    end

    factory :tag_with_blog_post do
      transient do
        blog_posts_count 5
      end

      after(:build) do |tag, evaluator|
        FactoryGirl.build_list(:blog_post, evaluator.blog_posts_count, tag:tag)
      end
    end
  end
end