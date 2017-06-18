require 'oauth'
require 'json'
module ZaimCoops
  module ZaimCoopsService
    CONSUMER_KEY = '42e3c1a01000915a47bd566f79cdf5bacc69b4b9'
    CONSUMER_SECRET = '859eb6d3b0e73d6a6ee1078292608b7220c18bff'
    API_URL = 'https://api.zaim.net/v2/'

    module_function
    def abstract_get_all(session,url)
      access_token = OAuth::AccessToken.new(ZaimCoopsService.get_consumer, session[:access_token], session[:access_secret])
      money = access_token.get(url)
      return JSON.parse(money.body)
    end

    def get_money_all(session)
      return abstract_get_all session,"#{API_URL}home/money"
    end

    def get_category_all(session)
      return abstract_get_all session,"#{API_URL}home/category"
    end

    def get_genre_all(session)
      return abstract_get_all session,"#{API_URL}home/genre"
    end

    def get_account_all(session)
      return abstract_get_all session,"#{API_URL}home/account"
    end

    def get_user(session)
      access_token = OAuth::AccessToken.new(ZaimCoopsService.get_consumer, session[:access_token], session[:access_secret])
      user =  access_token.get("#{API_URL}home/user/verify")
      return JSON.parse(user.body)['me']
    end

    def get_consumer
      return OAuth::Consumer.new(CONSUMER_KEY, CONSUMER_SECRET,
       site: 'https://api.zaim.net',
       request_token_path: '/v2/auth/request',
       authorize_url: 'https://auth.zaim.net/users/auth',
       access_token_path: '/v2/auth/access')
    end
  end
end
