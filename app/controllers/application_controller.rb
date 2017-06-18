require "oauth"
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  CALLBACK_URL = 'http://127.0.0.1:3000/callback'

  def login
      @request_token = ZaimCoops::ZaimCoopsService.get_consumer.get_request_token(oauth_callback: CALLBACK_URL)
      session[:request_token] = @request_token.token
      session[:request_secret] = @request_token.secret
      redirect_to @request_token.authorize_url(:oauth_callback => CALLBACK_URL)
  end

    def callback
      if session[:request_token] && params[:oauth_verifier]
        p "success"
        @oauth_verifier = params[:oauth_verifier]
        @request_token = OAuth::RequestToken.new(ZaimCoops::ZaimCoopsService.get_consumer, session[:request_token], session[:request_secret])

        access_token = @request_token.get_access_token(:oauth_verifier => @oauth_verifier)
        session[:access_token] = access_token.token
        session[:access_secret] = access_token.secret

        zaim_user = ZaimCoops::ZaimCoopsService.get_user session
        user = Users::UsersService.find_or_create_if_not_exists zaim_user
        session[:user] = user
        redirect_to '/portal/index'
      else
        p "failed"
        logout
      end
    end

    def logout
      session[:request_token] = nil
      session[:access_token] = nil
      redirect_to root_path
    end

    protected
    def authenticate_user
      if session[:user]
        @user = session[:user]
        return
      end
      redirect_to root_path
    end

end
