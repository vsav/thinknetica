module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(name, validation, *params)
      attr_reader :validations
      @validations ||= []
      instance_variable_set('@validation', variable: name, type: validation, options: params)
      @validations.push(instance_variable_get('@validation'))
    end
  end

  module InstanceMethods
    def validate!
      validations = self.class.instance_variable_get('@validations')
      validations.each do |validation|
        send(validation[:type], validation[:variable], validation[:options])
      end
    end

    def valid?
      validate!
      true
    rescue ArgumentError => e
      puts e
      false
    end

    def get_var(name)
      instance_variable_get("@#{name}")
    end

    protected

    def presence(variable, *)
      raise ArgumentError, "#{self.class} #{variable} не может быть пустым" if get_var(variable).to_s.empty?
    end

    def format(variable, format)
      format.each do |sample|
        raise ArgumentError, "#{self.class} #{variable} имеет неправильный формат" if get_var(variable) !~ sample
      end
    end

    def type(variable, type)
      type.each do |sample|
        raise ArgumentError, "#{self.class} #{variable} не соответствует типу" if get_var(variable).class != sample
      end
    end
  end
end
