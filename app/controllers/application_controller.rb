class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound,
              ActionController::RoutingError,
              ActionController::UnknownController,
              AbstractController::ActionNotFound,
    with: :render_404

  def render_404
    render 'errors/404', status: 404
  end

end
