class TagsController < ApplicationController
  respond_to :html
  
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end
  
end