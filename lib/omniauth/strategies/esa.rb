require 'json'
require 'omniauth-oauth'

module OmniAuth
  module Strategies
    class Esa < OmniAuth::Strategies::OAuth
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
        @raw_info ||= JSON.load(access_token.get('/v1/user')).body
      end

      def authorize_params
        params = super
        params[:scope] = request.params[:scope]
        params
      end
    end
  end
end
