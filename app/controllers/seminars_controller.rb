class SeminarsController < ApplicationController
  respond_to :html
  
  def index
    @seminars = Seminar.all
  end

  def show
    @seminar = Seminar.find(params[:id])
    @tags = @seminar.tags.uniq
  end
  
end