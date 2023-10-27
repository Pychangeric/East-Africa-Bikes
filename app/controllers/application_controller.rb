class ApplicationController < ActionController::Base
  include Clearance::Controller

  def placeholder
    render plain: 'This feature is not functional at the moment.'
  end
end
