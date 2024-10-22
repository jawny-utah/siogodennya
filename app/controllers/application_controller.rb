class ApplicationController < ActionController::Base
  def authenticate_admin_user!
    # return true if Rails.env.development?

    authenticate_or_request_with_http_basic do |name, password|
      name == 'siogodennya' && password == 'PutYourS2lf1!'
    end
  end
end
