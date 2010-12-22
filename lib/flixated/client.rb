require 'flixated/catalog'
require 'flixated/utils'

module Flixated
  class Client
    AUTHORIZE_URL = 'https://api-user.netflix.com/oauth/login'
    
    def initialize(options = {})
      @consumer_key = options[:consumer_key]
      @consumer_secret = options[:consumer_secret]
      @oauth_token = options[:oauth_token]
      @oauth_secret = options[:oauth_secret]
      @proxy = options[:proxy]
    end
    
    def authorize(oauth_token, oauth_secret, options = {})
      request_token = OAuth::RequestToken.new(consumer, oauth_token, oauth_secret)
      @access_token = request_token.get_access_token(options)
      @oauth_token = @access_token.token
      @oauth_secret = @access_token.secret
      @access_token
    end
    
    def request_token(options = {})
      consumer.get_request_token(options)
    end
    
    private
      def consumer
        consumer ||= OAuth::Consumer.new(@consumer_key, @consumer_secret, {
          :site             => 'http://api.netflix.com',
          :authorize_url    => 'https://api-user.netflix.com/oauth/login',
          :request_endpoint => @proxy
        })
      end
      
      def access_token
        @access_token ||= OAuth::AccessToken.new(consumer, @oauth_token, @oauth_secret)
      end
      
      def get(path, headers = {})
        headers.merge!('User-Agent' => "flixated gem v#{Flixated::VERSION}")
        JSON.parse access_token.get(sanitize_path(path), headers).body
      end
      
      def post(path, body = '', headers = {})
        headers.merge!('User-Agent' => "flixated gem v#{Flixated::VERSION}")
        JSON.parse access_token.post(sanitize_path(path), body, headers).body
      end
      
      def delete(path, headers = {})
        headers.merge!('User-Agent' => "flixated gem v#{Flixated::VERSION}")
        JSON.parse access_token.delete(sanitize_path(path), headers).body
      end
  end
end