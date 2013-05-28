class ErrorsController < ApplicationController
  
  def error_404
    @not_found_path = params[:not_found]
  end
 
  def error_500
  end

  ERRORS = [ 
    :internal_server_error,
    :not_found,
    :unprocessable_entity
  ].freeze
  
  ERRORS.each do |e|
    define_method e do
      respond_to do |format|
        format.html { render 'error_404', :status => e }
        format.any { head e }
      end
    end
  end

end
