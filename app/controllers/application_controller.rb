class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: proc{render_status 404}

  layout false

  protected
  def limit
    params.has_key?(:limit) ? params[:limit].to_i : 10
  end

  def offset
    params.has_key?(:offset) ? params[:offset].to_i : 0
  end

  def is_admin?
    session.has_key?(:admin) && session[:admin] == true
  end

  def render_status(status)
    render status: status, nothing: true
  end

  def authorize
    render_status 401 unless is_admin?
  end
end
