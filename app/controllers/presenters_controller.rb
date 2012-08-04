class PresentersController < ApplicationController
  respond_to :html
  
  def index
    @presenters = Presenter.all
  end

  def show
    @presenter = Presenter.find(params[:id])
    @tags = @presenter.seminars.collect{ |s| s.tags}.flatten.uniq
  end

end