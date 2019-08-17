module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(name, validation, *params)
      @validations ||= []
      @validations << instance_variable_set('@validation', variable: name, type: validation, options: params)
    end
  end

  module InstanceMethods
    def validate!
      validations = self.class.instance_variable_get('@validations')
      validations.each do |validation|
        @variable = get_var(validation[:variable])
        send(validation[:type], validation[:variable], validation[:options][0])
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

    def presence(attribute, *)
      raise ArgumentError, "#{self}: атрибут #{attribute} не может быть пустым" if @variable.to_s.empty?
    end

    def format(attribute, format)
      raise ArgumentError, "#{self}: атрибут #{attribute} имеет неправильный формат" if @variable !~ format
    end

    def type(attribute, type)
      raise ArgumentError, "#{self}: атрибут #{attribute} не соответствует типу" if @variable.class != type
    end
  end
end
