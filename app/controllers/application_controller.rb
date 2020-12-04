class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
