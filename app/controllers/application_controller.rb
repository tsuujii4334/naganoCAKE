class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource) 
    public_mypage_customers_path
  end
  
end
