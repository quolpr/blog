class BlogPost < ActiveRecord::Base
  SPLITTER = "~~~~~".freeze

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
  
  def preamble_part
    splitted_post[1] == nil ? '' : splitted_post[0]
  end

  def main_part
    splitted_post[1] == nil ? splitted_post[0] : splitted_post[1]
  end
  def splitted_post
    @splitted_post ||= post.split(SPLITTER, 2)
  end
end
