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
    tags = normalize_tags(tags)
    exist_tags = Tag.where(name:tags.map(&:values).flatten) || [] 
    exist_tags.collect!{|tag|{name:tag[:name], id:tag[:id]}}
    tags.each_index{|index|
      i = exist_tags.find_index{|exist_tag| exist_tag[:name] == tags[index][:name]}
      tags[index] = exist_tags[i] if i != nil
    }
    tags
  end 



  private   
  def self.normalize_tags(tags)
    tags = tags.map(&:values).flatten
    tags = tags
            .collect(&:strip)
            .collect(&:downcase)
            .compact
            .uniq
            .reject{|el| el.empty? || el == ','}
    tags.collect{|tag| {name:tag}}
  end   

  def create_path
    self.path = name
  end    

end
