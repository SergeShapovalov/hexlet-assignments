# frozen_string_literal: true

class AdminPolicy
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    return [403, {}, []] if env['PATH_INFO'].start_with?('/admin')
    @app.call(env)
    # END
  end
end
