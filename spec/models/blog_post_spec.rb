require 'rails_helper'

describe BlogPost do
  it{should ensure_length_of(:title).is_at_least(5).with_message(ValidationError::TOO_SHORT)}
  it{should ensure_length_of(:post).is_at_least(10).with_message(ValidationError::TOO_SHORT)}
  it{should validate_uniqueness_of(:title).with_message(ValidationError::NOT_UNIQUE)}
  it{should ensure_length_of(:path).is_at_least(5).with_message(ValidationError::TOO_SHORT)}
  
  it{should have_and_belong_to_many :tags}
  it{should validate_presence_of :tags}
end
