class ApplicationController < ActionController::Base

  before_filter :load_categories
  before_action :set_locale

  #protect_from_forgery with: :exception, prepend: true


  def load_categories
    @categories = Category.all
  end

  private

  # Sets the current locale according to the URL parameter. If there is no
  # parameter supplied the local will default to en
  def set_locale
    rx = /([A-Za-z]{2}(?:-[A-Za-z]{2})?)(?:;q=(1|0?\.[0-9]{1,3}))?/
    langs = request.env['HTTP_ACCEPT_LANGUAGE'].to_s.scan(rx).map do |lang, q|
        [lang, (q || '1').to_f]
    end
    accepted_locales = langs.sort_by(&:last).map(&:first).reverse
    if accepted_locales
      preferred_locale = (accepted_locales.map(&:to_s) & Rails.application.config.i18n.available_locales).first
      # currently we allow only en/de/etc. The main variety. Not the GB/CH/US like minor variants
      I18n.locale = preferred_locale[0..1] if preferred_locale
    end
  end
end
