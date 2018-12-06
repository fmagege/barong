# frozen_string_literal: true

module API::V2
  module Identity
    class Base < Grape::API
      cascade false

      format         :json
      content_type   :json, 'application/json'
      default_format :json

      helpers API::V2::Identity::Utils

      do_not_route_options!
      # Enable Rails sessions
      use ActionDispatch::Session::CookieStore

      rescue_from(ActiveRecord::RecordNotFound) do |_e|
        error!('Record is not found', 404)
      end

      rescue_from(Grape::Exceptions::ValidationErrors) do |error|
        error!(error.message, 400)
      end

      rescue_from(JWT::DecodeError) do |error|
        error!("Failed to decode and verify JWT", 403)
      end

      rescue_from(:all) do |error|
        Rails.logger.error "#{error.class}: #{error.message}"
        error!('Something went wrong', 500)
      end

      mount Identity::General
      mount Identity::Sessions
      mount Identity::Users

      add_swagger_documentation base_path: '/identity',
      info: {
        title: 'Barong',
        description: 'Public API for barong OAuth server '
      },
      api_version: 'v2',
      doc_version: '2.0.8-alpha', # Used to be BARONG::VERSION
      hide_format: true,
      hide_documentation_path: true,
      mount_path: '/swagger_doc'
    end
  end
end
