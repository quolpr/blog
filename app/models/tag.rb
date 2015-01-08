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

  def self.strToTags(tags)
    tags = normalize_tags(tags.split(','))
    exist_tags = Tag.where(name:tags) || [] 
    not_exist_tags = []
    tags.each {|tag|
      first_found = exist_tags.detect{|el| el.name == tag}
      not_exist_tags << Tag.new(name: tag) unless first_found.present?
    }
    exist_tags + not_exist_tags
  end 

  private   
  def self.normalize_tags(tags)
    tags
      .collect(&:strip)
      .collect(&:downcase)
      .compact
      .uniq
      .reject{|el| el.empty? || el == ','}
  end   

  def create_path
    self.path = name
  end    

end
