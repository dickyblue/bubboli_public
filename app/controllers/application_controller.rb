class ApplicationController < ActionController::Base
  protect_from_forgery
  
  include SessionsHelper
  
  # rescue_from Exception,  with: lambda { |exception| render_error 500, exception }
  rescue_from ActionController::RoutingError, ActionController::UnknownController, ::AbstractController::ActionNotFound, ActiveRecord::RecordNotFound, with: lambda { |exception| render_error 404, exception }
  rescue_from Timeout::Error, with: lambda { |exception| render_error 500, exception }
  
  private
  def render_error(status=500, exception=nil)
    respond_to do |format|
      format.html { render template: "errors/error_#{status}", layout: 'layouts/application', status: status }
      format.all { render nothing: true, status: status }
    end
  end
end
