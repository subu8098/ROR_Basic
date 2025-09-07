class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :redirect_not_found

  private

  def redirect_not_found
    # flash[:alert] = "Sorry, that page does not exist."
    # redirect_to '/404.html'
    
    redirect_to not_found_path
  end
end
