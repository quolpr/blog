class BlogPost < ActiveRecord::Base
  has_and_belongs_to_many :tags

  validates :post, length: {minimum: 10, too_short: ValidationError::TOO_SHORT}
  validates :title,
            length: {
              minimum: 5,
              too_short: ValidationError::TOO_SHORT
            }, uniqueness: {
              message: ValidationError::NOT_UNIQUE
            }
  validates :path, length: {minimum: 5, too_short: ValidationError::TOO_SHORT}
  validates_presence_of :tags
  accepts_nested_attributes_for :tags

end
