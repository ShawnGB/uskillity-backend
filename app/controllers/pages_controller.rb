class PagesController < ApplicationController
  def index
    @workshops = Workshop.last(6)
    @categories = Category.all
  end
end
