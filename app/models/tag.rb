class Tag < ActiveRecord::Base
  has_and_belongs_to_many :blog_posts

  validates :name,
            length: {
                minimum: 3,
                too_short: ValidationError::TOO_SHORT
            }, uniqueness: {
                message: ValidationError::NOT_UNIQUE
            }

end
