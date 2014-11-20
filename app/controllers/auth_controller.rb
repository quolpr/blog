class AuthController < ApplicationController
  def create
    if authorizer.admin? params[:username], params[:password]
      session[:admin] = true
      render_status 200
    else
      session[:admin] = false
      render_status 401
    end
  end

  def destroy
    session[:admin] = false
    render_status 200
  end

  private
  def authorizer
    @authorizer ||= Authorizer.new
  end
end
