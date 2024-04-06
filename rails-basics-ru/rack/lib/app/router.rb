# frozen_string_literal: true

require 'rack'

class Router
  def call(env)
    # BEGIN
    path = Rack::Request.new(env).path

    if path == '/'
      [200, {}, 'Hello, World!']
    elsif path == '/about'
      [200, {}, 'About page']
    else
      [404, {}, '404 Not Found']
    end
    # END
  end
end
