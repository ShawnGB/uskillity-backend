class PagesController < ApplicationController
  def index
    @workshops = Workshop.last(6)
    @categories = Category.all
  end

  def share_details
  end

  def looking_around
  end

  def inspiration
  end

end
