class BlogPostsController < ApplicationController
  before_action :authorize, only:[:create, :destroy, :update]

  def index
    @blog_posts = BlogPost
                      .limit(limit)
                      .offset(offset)
  end

  def update
    @blog_post = BlogPost.find(params[:id])
    @blog_post.update_attributes! blog_post_params
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
    @blog_post= BlogPost.create! blog_post_params
  end

  private
  def blog_post_params
    params.require(:blog_post).permit(:name, :post, tags_attributes:[:name])
  end
end