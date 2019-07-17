module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module InstanceMethods
    protected

    def register_instance
      self.class.items ||= {}
      self.class.items.merge!("#{name}": self)
    end
  end

  module ClassMethods
    attr_accessor :items
  end
end
