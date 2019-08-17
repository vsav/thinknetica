module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :validations
    def validate(name, validation, *params)
      @validations ||= []
      @validations << { variable: name, type: validation, options: params.first }
    end
  end

  module InstanceMethods
    def validate!
      self.class.validations.each do |validation|
        variable_value = get_var(validation[:variable])
        send("validate_#{validation[:type]}", variable_value, validation[:options])
      end
    end

    def valid?
      validate!
      true
    rescue ArgumentError => e
      false
    end

    def get_var(name)
      instance_variable_get("@#{name}")
    end

    protected

    def validate_presence(value, *)
      raise ArgumentError, 'Value presence error' if value.to_s.empty?
    end

    def validate_format(value, format)
      raise ArgumentError, 'Value format error' if value !~ format
    end

    def validate_type(value, value_type)
      raise ArgumentError, 'Value type error' if value.class != value_type
    end
  end
end
