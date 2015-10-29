class CommentsController < ApplicationController
  def new 
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.new(comment_params)
  	  if @comment.save
        respond_to do |format|
          format.html {redirect_to post_path(@post)}
          format.js
  	    end
  	  else
  	  	render :new
  	  end
  end 

  def edit 
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def update
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.find(params[:id])
  	  if @comment.update(comment_params)
  	  	redirect_to post_path(@comment.post)
  	  else
  	  	render :edit
  	  end
  end 

  def destroy
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.find(params[:id])
  	@comment.destroy
  	redirect_to post_path(@post)
  end

 private

  def comment_params
    params.require(:comment).permit(:content)
  end



end