class ApplicationController < ActionController::Base

  around_action :set_locale

  def set_locale(&action)
    # lang = current_user ? current_user.profile.language : extract_locale_from_accept_language_header
    lang = extract_locale_from_accept_language_header
    locale = params[:locale] || lang
    I18n.with_locale(locale, &action)
  end

  private

    def extract_locale_from_accept_language_header
      default_lang = :en
      lang_request = request.env['HTTP_ACCEPT_LANGUAGE']

      if lang_request.nil?
        default_lang
      else
        locale = lang_request.scan(/^[a-z]{2}/).first.to_sym
        (I18n.available_locales.include? locale) ? locale : default_lang
      end
    end
end
