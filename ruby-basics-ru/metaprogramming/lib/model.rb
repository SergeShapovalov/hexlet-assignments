# frozen_string_literal: true

# BEGIN
module Model
  module ModelClass
    @@attr_list = {}

    def attribute(name, options = {})
      define_method name do
        value = self.instance_variable_get "@#{name}"

        return value if value.nil?

        case options[:type]
        when :string
          String(value)
        when :integer
          Integer(value)
        when :datetime
          DateTime.parse(value)
        when :boolean
          !!value
        else
          value
        end
      end

      define_method "#{name}=" do |value|
        self.instance_variable_set "@#{name}", value
      end

      push_attr_list(name, options[:default])
    end

    def attr_list
      @@attr_list[self.name]
    end

    def push_attr_list(name, value = nil)
      @@attr_list[self.name] = {} if @@attr_list[self.name].nil?
      @@attr_list[self.name][name] = value
    end
  end

  def self.included(base)
    base.extend(ModelClass)
  end

  def initialize(params = {})
    self.class.attr_list.each do |key, default|
      send("#{key}=".to_sym, params[key] || default)
    end
  end

  def attributes
    variables = instance_variables.map do |variable|
      method = variable.to_s[1..-1].to_sym
      [method, send(method)]
    end

    Hash[variables]
  end
end
# END
