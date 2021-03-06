require_relative 'app/boot'

Dir[__dir__ + '/app/routes/v1/*.rb'].each {|file| require file }

class Server < Roda

  use Rack::Logger

  route do |r|
    r.on 'v1' do
      r.on 'ping' do
        r.run V1::PingApi
      end

      r.post 'auth' do
        r.run V1::AuthApi
      end

      r.on('user') do
        r.run V1::UserApi
      end

      r.on('users') do
        r.run V1::UsersApi
      end
    end
  end
end
