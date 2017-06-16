class HomeController < ApplicationController
  def index
    @zaim_user = nil
    if session[:access_token] && session[:request_token]
      set_consumer
      @access_token = OAuth::AccessToken.new(@consumer, session[:access_token], session[:access_secret])
      user =  @access_token.get("#{zaim_url}home/user/verify")
      @zaim_user = JSON.parse(user.body)['me'];
      p "user is"
      p @zaim_user
    end

  end
end
