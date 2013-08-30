# Mock HTTP layer for testing
#
# Example:
# --------
#     Tire.configure do |config|
#
#       config.client(Tire::HTTP::Client::Mock)
#
#     end
#
#
module Tire
  module HTTP
    module Client
      class Mock
        class << self
          def get(url, data = nil)
            request(:get, url, data)
          end

          def post(url, data)
            request(:post, url, data)
          end

          def put(url, data)
            request(:put, url, data)
          end

          def delete(url, data = nil)
            request(:delete, url, data)
          end

          def head(url)
            request(:head, url)
          end

          private
          def request(method, url, data = nil)
            # p "#{method.to_s.upcase} #{url} #{data.inspect}"
            Response.new(*::Tire::Mock.get)
          end
        end
      end
    end
  end
end