class Tag < ActiveRecord::Base
  has_and_belongs_to_many :blog_posts
  before_validation :create_path

  validates :name,
            length: {
                minimum: 3,
                too_short: ValidationError::TOO_SHORT
            }, uniqueness: {
                message: ValidationError::NOT_UNIQUE
            }

  def self.normalize_params(tags)
    tags = tags.map(&:values).flatten
    tags = tags
            .collect(&:strip)
            .compact
            .uniq
            .reject{|el| el.empty?}
    tags.collect{|tag| {name:tag}}
  end 

  def create_path
    self.path = name
  end
end
