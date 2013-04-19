class AdminsController < ApplicationController

  before_filter :verify_is_admin

  def index
  end

end
