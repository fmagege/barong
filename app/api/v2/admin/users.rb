# frozen_string_literal: true

module API::V2
  module Admin
    # Admin functionality over users table
    class Users < Grape::API
      resource :users do
        desc 'Returns array of users',
        security: [{ "BearerToken": [] }],
        failure: [
          { code: 401, message: 'Invalid bearer token' }
        ]
        get do
          users = []
          User.all.each do |u|
            users.push(u.attributes.except('password_digest'))
          end
          present users
        end

        desc 'Changes user state',
        security: [{ "BearerToken": [] }],
        failure: [
          { code: 401, message: 'Invalid bearer token' }
        ]
        params do
          requires :uid, type: String, desc: 'user uniq id', allow_blank: false
          requires :state, type: String, desc: 'user uniq id', allow_blank: false
        end
        post do
          error!('State already setted to this', 403)
          User.find_by_uid(params[:uid]).update(state: params[:state])
          status 200
        end
      end
    end
  end
end
