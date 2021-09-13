class ApplicationController < ActionController::Base
  before_action :authenticate_any!

  def authenticate_any!
    if user_signed_in?
      authenticate_user!
    else
      authenticate_admin!
    end
  end
end
