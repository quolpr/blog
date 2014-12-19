class Tag < ActiveRecord::Base
  has_and_belongs_to_many :blog_posts

  validates :name,
            length: {
                minimum: 3,
                too_short: ValidationError::TOO_SHORT
            }, uniqueness: {
                message: ValidationError::NOT_UNIQUE
            }

  def self.strToTags(tags)
    tags = normalize_tags(tags.split(','))
    exist_tags = Tag.find(name:tags)
    not_exist_tags = []
    tags.each {|tag|
      first_found = exist_tags.detect{|el| el.name == tag}
      not_exist_tags << {name: tag} unless first_found.present?
    }
    Tag.create not_exist_tags
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
end
