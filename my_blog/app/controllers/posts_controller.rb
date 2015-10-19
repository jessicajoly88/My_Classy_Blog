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
    @post = Post.new(post_params)
    tag_ids = params[:post][:tag]
  	if @post.save
      if tag_ids != nil
        if tag_ids.length > 0
          tag_ids.each do |tag_id|
            tag = Tag.find(tag_id)
            @post.tags.push(tag)
          end 
        end
      end
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