class PostsController < ApplicationController
  def index
  	@posts = Post.all
  	@tags = Tag.all
  end

  def show 
  	@post = Post.find(params[:id])
  	@tags = Tag.all
  end

  def new
  	@post = Post.new
  	@tags = Tag.all
  end

  def create
  	tag_id = params[:post][:tags]
  	tag = Tag.find(tag_id)
  	@post = Post.new(post_params)
  	@post.tags.push(tag)
  	if @post.save
  	  redirect_to posts_path
  	else
  	  render :new	
  	end
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	@post = Post.find(params[:id])
  	if @post.update(post_params)
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
    params.require(:post).permit(:body, :title)
  end
end