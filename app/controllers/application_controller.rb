class ApplicationController < ActionController::Base
  before_action :authenticate_any!

  def authenticate_any!
    if user_signed_in?
      authenticate_user!
    elsif admin_signed_in?
      authenticate_admin!
    elsif seller_signed_in?
      authenticate_seller!
    end
  end
end
