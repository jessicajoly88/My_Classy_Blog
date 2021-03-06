class TagsController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
  end
 
  def new 
  	@tag = Tag.new
  end
  
  def create
  	@tag = Tag.new(tag_params)
  	if @tag.save
  	  respond_to do |format|
        format.html { redirect_to posts_path }
        format.js
      end
  	else
  	  render :new
  	 end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
  	@tag = Tag.find(params[:id])
      respond_to do |format|
        format.html { redirect_to posts_path }
        format.js
      end
  	if @tag.update(tag_params)
  	else
  	  render :edit
  	end
  end

  def destroy
  	@tag = Tag.find(params[:id])
  	@tag.destroy
  	redirect_to posts_path
  end
 

private
  def tag_params
    params.require(:tag).permit(:name)
  end
end