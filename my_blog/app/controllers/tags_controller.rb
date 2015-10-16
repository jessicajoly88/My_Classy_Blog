class TagsController < ApplicationController
  def new 
  	@tag = Tag.new
  end
  
  def create
  	@tag = Tag.new(tag_params)
  	if @tag.save
  	  redirect_to posts_path
  	else
  	  render :new
  	 end
  end
 

private
  def tag_params
    params.require(:tag).permit(:name)
  end
end