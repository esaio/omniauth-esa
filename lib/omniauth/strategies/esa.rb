require 'json'
require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Esa < OmniAuth::Strategies::OAuth2
      DEFAULT_SCOPE = 'read'.freeze

      option :name, 'esa'
      option :client_options, site: 'https://api.esa.io'

      uid { raw_info['id'] }

      info do
        {
          nickname: raw_info['screen_name'],
          name:     raw_info['name'],
          email:    raw_info['email'],
          image:    raw_info['icon']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= JSON.load(access_token.get('/v1/user').body)
      end

      def callback_url
        full_host + script_name + callback_path
      end

      def authorize_params
        super.tap do |params|
          params[:scope] = request.params['scope'] if request.params['scope']
          params[:scope] ||= DEFAULT_SCOPE
        end
      end
    end
  end
end
