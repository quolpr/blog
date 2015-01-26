class BlogPostsController < ApplicationController
  before_action :authorize, only:[:create, :destroy, :update]

  def index
    @blog_posts = BlogPost
                      .limit(limit)
                      .offset(offset)
                      .order('id DESC')
  end
 
  def update
    normalize_tags blog_post_params
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
    normalize_tags blog_post_params
    @blog_post= BlogPost.create blog_post_params 
    render status: 400 unless @blog_post.valid?
  end

  private

  def normalize_tags(post) 
    post['tags'] = Tag.normalize_params(post['tags']) unless post['tags'].blank?
  end

  def blog_post_params
    params.require(:blog_post).permit( :title, :post, tags:[:name])
  end
end
