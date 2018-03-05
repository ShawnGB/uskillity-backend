class PagesController < ApiController
  def index
    @workshops = Workshop.last(20).sample(6)
    @categories = Category.all
  end

  def share_details
  end

  def looking_around
  end

  def inspiration
  end

  def impressum
  end

  def contact
  end
end
