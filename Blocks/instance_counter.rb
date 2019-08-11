module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :instances

  end

  module InstanceMethods

    protected

    def register_instance
      self.class.instances ||= 0 # instances = instances || instances = 0 (если nil) При таком способе она не будет nil 
      self.class.instances += 1
    end
  end
end
