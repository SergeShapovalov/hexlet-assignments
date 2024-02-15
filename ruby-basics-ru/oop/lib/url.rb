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
    decoded_query = if uri_query.nil?
        {}
      else
        URI.decode_www_form(uri_query)
    end

    @query = Hash[decoded_query.map{|(k,v)| [k.to_sym,v]}]
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