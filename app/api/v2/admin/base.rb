# frozen_string_literal: true

require_dependency 'barong/middleware/jwt_authenticator'

module API::V2
  module Admin
    class Base < Grape::API
      use Barong::Middleware::JWTAuthenticator, \
        pubkey: Rails.configuration.x.keystore.public_key

      cascade false

      format         :json
      content_type   :json, 'application/json'
      default_format :json

      helpers API::V2::Resource::Utils

      do_not_route_options!

      before do
        error!('Access Denied: User is not Admin', 401) unless current_user.role.admin?
      end

      rescue_from(ActiveRecord::RecordNotFound) do |_e|
        error!('Record is not found', 404)
      end

      rescue_from(Grape::Exceptions::ValidationErrors) do |error|
        error!(error.message, 400)
      end

      rescue_from Peatio::Auth::Error do |e|
        if Rails.env.production?
          error!('Permission Denied', 401)
        else
          Rails.logger.error "#{e.class}: #{e.message}"
          error!({ error: { code: e.code, message: e.message } }, 401)
        end
      end

      # Known Vault Error from TOTPService.with_human_error
      rescue_from(TOTPService::Error) do |error|
        error!(error.message, 422)
      end

      rescue_from(:all) do |error|
        Rails.logger.error "#{error.class}: #{error.message}"
        error!('Something went wrong', 500)
      end

      mount Admin::Users

      add_swagger_documentation base_path: '/admin',
      info: {
        title: 'Barong',
        description: 'Protected API for barong OAuth server '
      },
      security_definitions: {
        "BearerToken": {
          description: 'Bearer Token authentication',
          type: 'jwt',
          name: 'Authorization',
          in: 'header'
        }
      },
      models: [
        Entities::Label,
        Entities::APIKey,
        Entities::Profile,
        Entities::UserWithProfile
      ],
      api_version: 'v2',
      doc_version: '2.0.8-alpha', # Used to be BARONG::VERSION
      hide_format: true,
      hide_documentation_path: true,
      mount_path: '/swagger_doc'
    end
  end
end
