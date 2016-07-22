class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_filter :load_categories
  protect_from_forgery with: :exception, prepend: true

  def load_categories
    @categories = Category.all
  end
end
