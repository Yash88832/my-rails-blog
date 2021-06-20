class PostsController < ApplicationController

  # list all posts
 	def index
    @posts = current_user.posts.all
    @image_index = Post::IMAGE_INDEX
    @published = @posts.published
    @archived = @posts.archived
    @tags = Tag.includes(:posts)
 	end

 	# find posts record
 	def show
    @post = Post.find(params[:id])
 	end

  # GET /published/posts
  def published
    @published_posts = current_user.posts.published
    @image_index = Post::IMAGE_INDEX
  end

  # GET /archived/posts
  def archived
    @archived_posts = current_user.posts.archived
    @image_index = Post::IMAGE_INDEX
  end

  # GET /posts/tags/name
  def list_by_tag
    @tag = Tag.find_by_id(params[:id])
    @posts = @tag.posts
    @image_index = Post::IMAGE_INDEX
  end 
end
