require 'rails_helper'

describe Tag, :unit do
  it{should validate_uniqueness_of(:name).with_message(ValidationError::NOT_UNIQUE)}
  it{should ensure_length_of(:name).is_at_least(3).with_message(ValidationError::TOO_SHORT)}
  it{should have_and_belong_to_many :blog_posts}
end
