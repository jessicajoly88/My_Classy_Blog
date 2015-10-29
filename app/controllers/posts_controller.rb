class PostsController < ApplicationController
  before_action :current_admin, only: [ :edit, :update, :destroy, :create ]


  def index
  	@posts = Post.all.sort_by{|post|
      (post.rating + (1/(Time.new - post.created_at) * 1000))}
    @posts.reverse!
  	@tags = Tag.all
  end

  def show
  	@post = Post.find(params[:id])
  end

  def new
  	@post = Post.new
  	@tags = Tag.all
  end

  def create
    @post = Post.new(post_params)
    @post.rating = 0
    tag_ids = params[:post][:tag]
  	if @post.save
      respond_to do |format|
        format.html { redirect_to posts_path }
        format.js
      end
        if tag_ids != nil
          if tag_ids.length > 0
            tag_ids.each do |tag_id|
              tag = Tag.find(tag_id)
              @post.tags.push(tag)
          end
        end
      end
      
    else
      render :new
    end
  end

  def edit
  	@post = Post.find(params[:id])
    @tags = Tag.all
      if params[:upvote]
        new_rating = @post.rating + 1
        @post.update(rating: new_rating)
        redirect_to posts_path
      end
  end

  def update
  	@post = Post.find(params[:id])
    tag_ids = params[:post][:tag]
  	if @post.update(post_params)
      if tag_ids == nil
        @post.tags.destroy_all()
      elsif tag_ids.length > 0
         tag_ids.each do |tag_id|
            tag = Tag.find(tag_id)
            @post.tags.push(tag)
          end
      end
      redirect_to posts_path
  	else
      render :edit
    end
  end

  def destroy
  	@post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

private
  def post_params
    params.require(:post).permit(:body, :title, :image)
  end
end
