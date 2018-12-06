module API::V2
  class Base < Grape::API
    mount Identity::Base   => '/identity'
    mount Resource::Base   => '/resource'
    mount Management::Base => '/management'

    route :any, '*path' do
      error! 'Route is not found', 404
    end
  end
end
