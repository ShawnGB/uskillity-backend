class PagesController < ApplicationController
  def index
    @workshops = Workshop.last(6)
  end
end
