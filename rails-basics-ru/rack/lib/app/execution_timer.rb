class ExecutionTimer
  def initialize(app)
    @app = app
  end

  def call(env)
    now = Time.now
    status, headers, body = @app.call(env)
    headers['X-Execution-Time'] = ((now - Time.now) * 1000000).to_s

    [status, headers, body]
  end
end