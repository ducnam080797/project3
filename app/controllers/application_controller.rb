class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery with: :exception
  before_action :set_locale

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t "please_login_account"
    redirect_to signin_path
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end
end
