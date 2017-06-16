require "json"
require "oauth"
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  CONSUMER_KEY = '42e3c1a01000915a47bd566f79cdf5bacc69b4b9'
  CONSUMER_SECRET = '859eb6d3b0e73d6a6ee1078292608b7220c18bff'
  CALLBACK_URL = 'http://127.0.0.1:3000/callback'
  API_URL = 'https://api.zaim.net/v2/'



  def login
      set_consumer
      @request_token = @consumer.get_request_token(oauth_callback: CALLBACK_URL)
      session[:request_token] = @request_token.token
      session[:request_secret] = @request_token.secret
      p "request_token is!"
      p @request_token
      redirect_to @request_token.authorize_url(:oauth_callback => CALLBACK_URL)
  end

    def callback
      if session[:request_token] && params[:oauth_verifier]
        p "success"
        set_consumer
        @oauth_verifier = params[:oauth_verifier]
        @request_token = OAuth::RequestToken.new(@consumer, session[:request_token], session[:request_secret])
        access_token = @request_token.get_access_token(:oauth_verifier => @oauth_verifier)
        session[:access_token] = access_token.token
        session[:access_secret] = access_token.secret

        @access_token = OAuth::AccessToken.new(@consumer, session[:access_token], session[:access_secret])
        user =  @access_token.get("#{API_URL}home/user/verify")

        @zaim_user = JSON.parse(user.body);
        p @zaim_user
        redirect_to root_path
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
    
    def zaim_url
      return API_URL;
    end

    def set_consumer
      @consumer = OAuth::Consumer.new(CONSUMER_KEY, CONSUMER_SECRET,
        site: 'https://api.zaim.net',
        request_token_path: '/v2/auth/request',
        authorize_url: 'https://auth.zaim.net/users/auth',
        access_token_path: '/v2/auth/access')
    end
end
