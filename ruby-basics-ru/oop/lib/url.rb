# frozen_string_literal: true

# BEGIN
require 'uri'

class Url
  include Comparable

  attr_accessor :scheme, :host, :port

  def initialize(address)
    uri = URI(address)

    @scheme = uri.scheme
    @host = uri.host
    @port = uri.port
    @path = uri.path

    uri_query = uri.query
    decoded_query = uri_query.nil? ? [] : URI.decode_www_form(uri_query)
    @query = decoded_query.to_h.transform_keys &:to_sym
  end

  def query_params
    @query
  end

  def query_param(key, value = nil)
    @query[key] || value
  end

  def <=>(other)
    precedence <=> other.precedence
  end

  protected

  def precedence
    [scheme, host, port, query_params]
  end
end
# END
