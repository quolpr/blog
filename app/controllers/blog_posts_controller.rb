class BlogPostsController < ApplicationController
  before_action :authorize, only:[:create, :destroy, :update]
  before_action :normalize_tags, only:[:create, :update]

  def index
    @blog_posts = BlogPost
                      .limit(limit)
                      .offset(offset)
                      .order('id DESC')
  end
 
  def update
    @blog_post = BlogPost.find(params[:id])
    @blog_post.update_attributes blog_post_params
    render_status 200
  end   

  def destroy
    BlogPost.find(params[:id]).destroy
    render_status 200
  end
 
  def show
    @blog_post = BlogPost.find(params[:id])
  end

  def create
    @blog_post= BlogPost.new blog_post_params
    @blog_post.save
    render status: 400 unless @blog_post.valid?
  end

  private

  def normalize_tags
    #return if blog_post_params['tags_attributes'].blank?
    #blog_post_params['tags_attributes'] = Tag.normalize_params(blog_post_params['tags_attributes'])
  end

  def blog_post_params
    @blog_post_params ||= params.require(:blog_post).permit( :title, :post, tags_attributes: [:name, :tag_id])
  end 
end
